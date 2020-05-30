from django.urls import path, include
from django.conf.urls import url
from django.contrib.auth import views as login
from django.shortcuts import get_object_or_404
from . import views
from . import models


loginred = get_object_or_404(models.Boards, id=1)

urlpatterns = [
    path('', login.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout', login.LogoutView.as_view(), name='logout'),
    path('cad', views.cad, name='cadastro'),
    path('boards', views.boards, name='boards'),
    path('board/<slug:name>', views.kanban, name='kanban'),
    path('board/<slug:name>/detail/<int:pk>/', views.Details, name='detail'),
    path('board/<slug:name>/metrics', views.metrics, name='metrics'),
    path('git', views.git, name='git'),

]