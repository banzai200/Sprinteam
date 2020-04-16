"""
Todos as funções para se trabalhar com a API

https://developers.google.com/calendar/v3/reference/events/insert

"""


import pickle
from datetime import timezone, timedelta
import credentials as credentials
import datefinder
from google.protobuf import service
from apiclient.discovery import build


"""Para a criação do envento no Google Calendar, é necessário executar algumas etapas.

https://console.developers.google.com/

> Criação de serviço da API
> Criação das credenciais
> Criar ID de cliente OAuth
> Gerar o arquivo.jason
> pip instalar google-api python-cliente
> Authorizing Requests to the Google Calendar API (https://developers.google.com/calendar/auth)

Este comando execuatdo no Jupyter, o levará para para a página do google para gerar o Token de acesso
scopes = [' https://www.googleapis.com/auth/calendar' ]

flow = InstalledAppFlow.from_client_secrets_file("calender_key.json", scopes=scopes)
credentials = flow.run_console()
"""


"""salvar essas credenciais em um arquivo Pickle em python.
Pickle é um cabo para salvar qualquer tipo de objeto python dentro do arquivo Pickle.
"""
pickle.dump(credentials, open("token.pkl", "wb"))
credentials = pickle.load(open("token.pkl", "rb"))


#crie um objeto de serviço para nossa API usando a função build do módulo apiclient.discovery
service = build("calendar", "v3", credentials=credentials)


#Isso exibirá todos os calendários que você possui no seu Google Calendar
result = service.calendarList().list().execute()

#Pegar o ID
calendar_id = result['items'][0]['id']

#ver meus eventos!
result = service.events().list(calendarId=calendar_id).execute()
print(result['items'][0])


def create_event(start_time_str, summary, duration=1, attendees=None, description=None, location=None, pp=None):
    matches = list(datefinder.find_dates(start_time_str))
    if len(matches):
        start_time = matches[0]
        end_time = start_time + timedelta(hours=duration)

    event = {
        'summary': summary,
        'location': location,
        'description': description,
        'start': {
            'dateTime': start_time.strftime("%Y-%m-%dT%H:%M:%S"),
            'timeZone': timezone,
        },
        'end': {
            'dateTime': end_time.strftime("%Y-%m-%dT%H:%M:%S"),
            'timeZone': timezone,
        },
        'attendees': [
            {'email': attendees},
        ],
        'reminders': {
            'useDefault': False,
            'overrides': [
                {'method': 'email', 'minutes': 24 * 60},
                {'method': 'popup', 'minutes': 10},
            ],
        },
    }
    pp.pprint('''*** %r event added: 
    With: %s
    Start: %s
    End:   %s''' % (summary.encode('utf-8'),
                    attendees, start_time, end_time))

    return service.events().insert(calendarId='primary', body=event, sendNotifications=True).execute()


def createevent():

    event = {
        'summary': 'Google I/O 2015',
        'location': 'Rua Alfazem, São Paulo',
        'description': 'Create first project in Google Calendar of Sprinteam\'s developer group.',
         'start': {
            'dateTime': '2020-05-28T09:00:00-07:00',
            'timeZone': 'America/São Paulo',
            },
        'end': {
            'dateTime': '2020-05-28T17:00:00-07:00',
            'timeZone': 'America/São Paulo',
        },
        'recurrence': [
            'RRULE:FREQ=DAILY;COUNT=2'
        ],
        'attendees': [
            {'email': 'lpage@example.com'},
            {'email': 'sbrin@example.com'},
         ],
        'reminders': {
            'useDefault': False,
            'overrides': [
            {'method': 'email', 'minutes': 24 * 60},
            {'method': 'popup', 'minutes': 10},
            ],
        },
    }

    event = service.events().insert(calendarId='Sptrinteam', body=event).execute()
    print ('Event created: %s' % (event.get('htmlLink')))


if __name__ == '__main__':
    createEvent()
