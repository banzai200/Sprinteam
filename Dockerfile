FROM python:3.8.2

RUN apt-get update && apt-get install -y --no-install-recommends mime-support postgresql-client && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

RUN pip install Django==3.0.5 psycopg2>=2.5.4

EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:8000