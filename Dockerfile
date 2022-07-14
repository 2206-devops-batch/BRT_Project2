# Pull an official base image
FROM python:3.10.5-slim-bullseye

# Setting work directory
WORKDIR /flask-app

# Install dependencies
COPY ./requirements.txt /flask-app/requirements.txt
RUN pip install -r requirements.txt

# Copy src files
COPY . /flask-app

# Run Server
CMD ["flask", "run", "--host=0.0.0.0"]
