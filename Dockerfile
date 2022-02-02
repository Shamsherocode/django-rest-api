FROM python:3.9

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-client \
    && rm -rf /var/lib/apt/lists/*

 	
COPY angular_web_app/requirements.txt /app/

 	
WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app/

WORKDIR /app/angular_web_app

EXPOSE 8000

RUN python manage.py makemigrations && python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]