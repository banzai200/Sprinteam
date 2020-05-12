from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404
from django.views.generic import ListView, DetailView
from django.contrib.auth.decorators import login_required
from kanban.forms import SignUpForm
from .models import Teams, Categories, Boards, Cards, Lists
from . import gitfunc


def auth(request):

    return render(request, 'login.html')


def cad(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('login')
    else:
        form = SignUpForm()
    return render(request, 'cad.html', {'form': form})


@login_required(login_url='/')
def kanban(request, *args, **kwargs):
    team = get_list_or_404(Teams)
    board_list = get_list_or_404(Boards)
    board = get_object_or_404(Boards, b_name=kwargs['pk'].capitalize(), )
    lists = get_list_or_404(Lists)
    context = {'team': team, 'board': board, 'list_board': lists, 'board_list': board_list}
    return render(request, 'kanban/cards.html', context)


def tasks(request):
    return render(request, 'tasks.html')


@login_required(login_url='/')
def metrics(request):
    return render(request, 'base.html')


def git(request):
    list = gitfunc.getrepos()
    context = {'git': list}
    return render(request, 'testing.html', context)


class Details(DetailView):
    @login_required(login_url='/')
    def get(self, request,  *args, **kwargs):
        card = get_object_or_404(Cards, pk=kwargs['pk'])
        context = {'card': card}
        return render(request, 'kanban/details.html', context)
