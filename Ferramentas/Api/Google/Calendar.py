from google.protobuf import service


def createEvent():

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
