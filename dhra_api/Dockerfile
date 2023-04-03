FROM python:3.10-alpine3.17

WORKDIR /app

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait  /wait
RUN chmod +x /wait

ADD requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . .

ADD start_app.sh /start_app.sh
RUN chmod +x /start_app.sh

CMD ["start_app.sh"]