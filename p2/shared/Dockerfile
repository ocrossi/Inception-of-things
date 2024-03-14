FROM ubuntu:latest

RUN apt update && apt install python3 python3-pip

RUN pip install flask

ENTRYPOINT FLASK_APP=/vagrant_shared/app1.py flask run --host=0.0.0.0 --port=8080
