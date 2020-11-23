FROM python:alpine

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT FLASK_APP=app.py flask run --host=0.0.0.0 --port=${PORT:-3000}

