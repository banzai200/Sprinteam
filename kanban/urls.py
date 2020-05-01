from django.urls import path
from django.conf.urls import url

from . import views

urlpatterns = [
    path('', views.auth, name='login'),
    path('cad', views.cad, name='cadastro'),
    path('tasks', views.tasks, name='tasks'),
    path('board/<slug:pk>', views.kanban, name='kanban'),
    path('board/detail/<int:pk>/', views.Details.as_view(), name='detail'),
    path('metrics', views.metrics, name='metrics'),

]