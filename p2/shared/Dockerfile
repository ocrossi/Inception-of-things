FROM alpine:latest

RUN apk add python3 py3-flask
WORKDIR /vagrant_shared/
COPY ./app1.py .
EXPOSE 5000

ENTRYPOINT ["python3", "app1.py"]
