## Sprinteam

Fase inicial do projeto

##  Deploy do banco de dados:

Instalar docker e docker-compose e executar `docker-compose up -d`
Será executado o postgres na porta 5432 e o adminer para consulta rápida no banco de dados na porta 8080

Adminer Acessível via http://localhost:8080

Rede as migrations com `docker exec -it sprinteam_web python manage.py migrate`.

Django Acessível via http://localhost:8000
