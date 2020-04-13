from django.shortcuts import render
from .models import Teams
from .models import Boards


def kanban(request):
    team = Teams.objects.get(t_name='Sprinteam')
    board = Boards.objects.get()
    return render(request, 'postits.html', {'team': team, 'board': board})


def tasks(request):
    return render(request, 'tasks.html')
