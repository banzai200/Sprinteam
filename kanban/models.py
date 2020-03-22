from django.db import models

# Create your models here.
#class Users(models.Model):

class Cards(models.Model):
    Name = models.CharField(max_length=40)
    Description = models.CharField(max_length=500)
    Topic = models.CharField(max_length=10)
#    Responsible = models.ForeignKey(Users, on_delete=models.CASCADE)
    Deadline = models.DateTimeField('deadline')
    Complexity = models.IntegerField(default=1)

class Boards(models.Model):
    Name = models.CharField(max_length=40)
    Description = models.CharField(max_length=500)
    Topics = models.CharField(max_length=10)
    Points = models.IntegerField(default=0)



