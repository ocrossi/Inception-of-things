# start by pulling the python image
#FROM alpine:3.19
FROM python:3.11.8-alpine
# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
# RUN pip install -r requirements.txt

# RUN apk add python3 py3-pip py3-flask

# copy every content from the local file to the image
COPY . /app

RUN adduser -D rossi
USER rossi
RUN pip install --no-cache-dir --upgrade pip 
RUN pip install --no-cache-dir flask

# configure the container to run in an executed manner
ENTRYPOINT [ "python" ]

CMD ["view.py" ]
