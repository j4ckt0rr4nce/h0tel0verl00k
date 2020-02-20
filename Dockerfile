FROM python:latest

RUN useradd -m -d /home/h0tel0verl00k h0tel0verl00k

WORKDIR /home/h0tel0verl00k

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY h0tel0verl00k.py config.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP h0tel0verl00k.py

RUN chown -R h0tel0verl00k:h0tel0verl00k ./
USER h0tel0verl00k

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
