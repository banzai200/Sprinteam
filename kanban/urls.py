from django.urls import path, include
from django.conf.urls import url
from django.contrib.auth import views as login

from . import views

urlpatterns = [
    path('', login.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout', login.LogoutView.as_view(), name='logout'),
    path('cad', views.cad, name='cadastro'),
    path('tasks', views.tasks, name='tasks'),
    path('board/<slug:pk>', views.kanban, name='kanban'),
    path('board/detail/<int:pk>/', views.Details.as_view(), name='detail'),
    path('metrics', views.metrics, name='metrics'),
    path('git', views.git, name='git'),

]