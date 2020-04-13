from django.db import models

# Montar tabelas do banco de dados como classe aqui.
# Sugerido olhar na documentação como cada tipo de dado traduz para o banco de dados
# Create your models here.


class Teams(models.Model):
    t_name = models.CharField(max_length=100)
    t_company = models.CharField(max_length=100)
    t_details = models.CharField(max_length=400)


class Users(models.Model):
    u_name = models.CharField(max_length=40)
    u_username = models.CharField(max_length=80)
    u_email = models.CharField(max_length=80)
    u_admin = models.IntegerField(default=0)
    u_team = models.ForeignKey(Teams, on_delete=models.CASCADE, default='')

class Boards(models.Model):
    b_name = models.CharField(max_length=40)
    b_description = models.CharField(max_length=500)
    b_topics = models.CharField(max_length=10)
    b_points = models.IntegerField(default=0)
    b_team = models.ForeignKey(Teams, on_delete=models.CASCADE, default='')


class Lists(models.Model):
    list_name = models.CharField(max_length=30)
    list_position = models.IntegerField()
    list_board = models.ForeignKey(Boards, on_delete=models.CASCADE, default='')


class Cards(models.Model):
    c_name = models.CharField(max_length=40)
    c_description = models.CharField(max_length=500)
    c_topic = models.CharField(max_length=10)
    c_assigned = models.ForeignKey(Users, on_delete=models.CASCADE, default='')
    c_deadline = models.DateTimeField('deadline')
    c_complexity = models.IntegerField(default=1)
    c_list = models.ForeignKey(Lists, on_delete=models.CASCADE, default='')

class Categories(models.Model):
    cat_name = models.CharField(max_length=20)
    cat_board = models.ForeignKey(Boards, on_delete=models.CASCADE, default='')