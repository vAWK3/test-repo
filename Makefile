
PROJECT_NAME=app
DOCKER_COMPOSE_FILE=docker-compose.yml

DOCKER_COMPOSE=docker compose -f $(DOCKER_COMPOSE_FILE)
EXEC_DJANGO=$(DOCKER_COMPOSE) exec web

DJANGO_SERVICE=web
MANAGE_PY=$(DOCKER_COMPOSE) exec -T $(DJANGO_SERVICE) python app/manage.py

build:
	$(DOCKER_COMPOSE) build

migrate:
	$(EXEC_DJANGO) python app/manage.py makemigrations
	$(EXEC_DJANGO) python app/manage.py migrate

db-shell:
	$(EXEC_DJANGO) python app/manage.py dbshell

up:
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) down

# Access the Django shell
shell:
	$(EXEC_DJANGO) python app/manage.py shell

# Create superuser
createsuperuser:
	$(EXEC_DJANGO) python app/manage.py createsuperuser    

restart: stop start

create-app:
	django-admin startapp $(app)
