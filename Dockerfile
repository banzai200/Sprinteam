FROM python:3.8.2

RUN apt-get update && apt-get install -y --no-install-recommends mime-support postgresql-client && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/

RUN pip install -r requirements.txt

EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:8000
