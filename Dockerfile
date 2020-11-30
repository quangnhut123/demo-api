FROM quangnhut123/demo-api

# Install sql-migrate
RUN set -ex && \
  apk add --no-cache --virtual .installer go git build-base make && \
  go get -v github.com/rubenv/sql-migrate/...

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT FLASK_APP=app.py flask run --host=0.0.0.0 --port=${PORT:-3000}
