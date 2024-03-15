FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask

WORKDIR /opt/

COPY ./app1.py .

# EXPOSE 8080

RUN FLASK_APP=/opt/app1.py flask run --host=0.0.0.0 --port=8080
