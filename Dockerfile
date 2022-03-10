# FROM python:3.9-alpine


# ENV PYTHONUNBUFFERED 1

# RUN mkdir /app

# WORKDIR /app

# RUN pip install --upgrade pip

# COPY requirements.txt .

# RUN pip install -r requirements.txt

# COPY ./app /app

# COPY ./entrypoint.sh /
# ENTRYPOINT ["sh", "/entrypoint.sh"]

FROM python:3.9

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /angular_web_app
COPY ./angular_web_app /angular_web_app
WORKDIR /angular_web_app
COPY ./scripts /scripts

RUN chmod +x /scripts/*

RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static

CMD ["entrypoint.sh"]
