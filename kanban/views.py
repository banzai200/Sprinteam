from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404
from django.views.generic import ListView, DetailView
from django.db.models import Sum, Max, Min
from django.contrib.auth.decorators import login_required
from kanban.forms import SignUpForm
from .models import Teams, Categories, Boards, Cards, Lists
from . import gitfunc


def cad(request):
    team_list = get_list_or_404(Teams)
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            username.initial = 'Username'
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('login')
    else:
        form = SignUpForm()
    return render(request, 'cad.html', {'form': form, 'team_list': team_list})


@login_required(login_url='/')
def boards(request):
    board_list = get_list_or_404(Boards)
    context = {'board_list': board_list}
    return render(request, 'baselog.html', context)


@login_required(login_url='/')
def kanban(request, *args, **kwargs):
    team = get_list_or_404(Teams)
    board_list = get_list_or_404(Boards.objects.order_by('id'))
    board = get_object_or_404(Boards, b_name=kwargs['name'].capitalize())
    lists = get_list_or_404(Lists.objects.filter(list_board_id=board.id).order_by('list_position'))
    if not lists:
        lists = {'': ''}
    points = Cards.objects.filter(c_list=3).aggregate(Sum('c_complexity'))
    complexity = Cards.objects.aggregate(Sum('c_complexity'))
    context = {'team': team, 'board': board, 'list_board': lists, 'board_list': board_list, 'complexity': complexity,
               'points': points}
    return render(request, 'kanban/cards.html', context)


@login_required(login_url='/')
def metrics(request, *args, **kwargs):
    board = get_object_or_404(Boards, b_name=kwargs['name'].capitalize(), )
    board_list = get_list_or_404(Boards.objects.order_by('id'))
    hardest = Cards.objects.filter(c_board=board.id).annotate(Min('c_complexity'))
    if hardest:
        hardest = hardest[0]
    easiest = Cards.objects.filter(c_board=board.id).annotate(Max('c_complexity')).order_by('-c_complexity')
    if easiest:
        easiest = easiest[0]
    todo = Cards.objects.filter(c_list=1, c_board=board.id).count()
    doing = Cards.objects.filter(c_list=2, c_board=board.id).count()
    done = Cards.objects.filter(c_list=3, c_board=board.id).count()
    progress = todo + doing
    count = Cards.objects.filter(c_board=board.id).count()
    avg = count + progress / 2
    calc = count - progress
    if avg == 0 & calc == 0:
        number = 0
    else:
        number = calc / avg * 100
    pie = [['A Fazer', todo], ['Fazendo', doing], ['Feito', done]]
    context = {'board': board, 'board_list': board_list, 'hardest': hardest, 'easiest': easiest, 'number': number, 'pie': pie}
    return render(request, 'metrics/metrics.html', context)


def git(request):
    list = gitfunc.getrepos()
    context = {'git': list}
    return render(request, 'testing.html', context)


@login_required(login_url='/')
def Details(request,  *args, **kwargs):
    board = get_object_or_404(Boards, b_name=kwargs['name'].capitalize(), )
    card = get_object_or_404(Cards, pk=kwargs['pk'])
    team = get_list_or_404(Teams)
    board_list = get_list_or_404(Boards)
    lists = get_list_or_404(Lists)
    context = {'team': team, 'board': board, 'list_board': lists, 'board_list': board_list, 'card': card}
    return render(request, 'kanban/details.html', context)


@login_required(login_url='/')
def Edit(request,  *args, **kwargs):
    board = get_object_or_404(Boards, b_name=kwargs['name'].capitalize())
    card = get_object_or_404(Cards, pk=kwargs['pk'],)
    team = get_list_or_404(Teams)
    board_list = get_list_or_404(Boards)
    lists = get_list_or_404(Lists)
    context = {'team': team, 'board': board, 'list_board': lists, 'board_list': board_list, 'card': card}
    return render(request, 'kanban/edit.html', context)