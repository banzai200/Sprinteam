from django import forms
from django.forms import ModelForm
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Cards


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )


class CardForm(ModelForm):
    class Meta:
        model = Cards
        exclude = ('c_assigned_id', 'c_list_id', 'c_position')
#        fields = ('c_name', 'c_complexity', 'c_topic', 'c_deadline', 'c_description')
