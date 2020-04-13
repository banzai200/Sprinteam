from calendar_api.calendar_api import google_calendar_api
import json

calendar = google_calendar_api()

calendar.create_event(calendar_id='guedes48@gmail.com',
                      start='2020-04-14T14:00:00-03:00',
                      end='2020-04-14T15:00:00-03:00',
                      desc='Test')
