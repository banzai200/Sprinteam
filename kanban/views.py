from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect, get_object_or_404, get_list_or_404
from django.views import View
from django.views.generic import ListView, DetailView

from kanban.forms import SignUpForm
from .models import Teams
from .models import Boards
from .models import Cards


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
    return render(request, 'testing.html', {'form': form})


def kanban(request):
    return render(request, 'postits.html')


def tasks(request):
    return render(request, 'tasks.html')


class Details(DetailView):
    def get(self, request,  *args, **kwargs):
        card = get_object_or_404(Cards, pk=kwargs['pk'])
        context = {'card': card}
        return render(request, 'details.html', context)
