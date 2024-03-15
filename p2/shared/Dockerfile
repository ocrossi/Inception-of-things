FROM python:alpine3.19

#Set the working directory in the container to /app
WORKDIR /app

#Copy the current directory contents into the container at /app
COPY . /app

#Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

#Make port 80 available to the world outside this container
EXPOSE 5001

#Run app.py when the container launches
CMD ["python", "app1.py", "--port=5001"]
