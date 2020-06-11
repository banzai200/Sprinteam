from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User


class SignUpForm(UserCreationForm):
    first_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    last_name = forms.CharField(max_length=30, required=False, help_text='Optional.')
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2', )


class CardForm(forms.Form):
    card_name = forms.CharField(max_length=200, label='Nome do Card')
    card_complexity = forms.IntegerField(max_value=100, label='Complexidade do Card')
    card_topic = forms.CharField(max_length=10, label='Tópico do Card')
    card_deadline = forms.DateField(label='Data limite para entrega')
    card_description = forms.CharField(max_length=500, label="Descrição do Card")