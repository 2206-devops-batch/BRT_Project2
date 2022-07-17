# Pull an official base image
FROM python:3.11.0b4-alpine3.16

# create work directory and cd into it
WORKDIR /flask-app

# Install dependencies
COPY ./requirements.txt /flask-app/requirements.txt
RUN pip install -r ./requirements.txt

# Copy src files
COPY . /flask-app

# Run Server -default port is 5000
CMD ["flask", "run", "--host=0.0.0.0"]
