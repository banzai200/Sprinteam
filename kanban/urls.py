from django.urls import path
from django.conf.urls import url

from . import views

urlpatterns = [
    path('', views.auth, name='login'),
    path('cad', views.cad, name='cadastro'),
    path('tasks', views.tasks, name='tasks'),
    path('kanban', views.kanban, name='kanban'),
    path('kanban/detail/<int:pk>/', views.Details.as_view(), name='detail'),
]