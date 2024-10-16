FROM python:3.11.9-slim-bullseye

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

ADD pyproject.toml /app
ADD pytest.ini /app
COPY tests /app/tests
COPY manage.py /app

RUN pip install --upgrade pip
RUN pip install poetry

RUN poetry config virtualenvs.create false
RUN poetry install --no-root --no-interaction --no-ansi

COPY /src/* /app/src/