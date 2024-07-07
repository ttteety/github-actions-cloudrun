FROM python:3.9-slim 

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image
COPY . /src 
WORKDIR /src 

# Install Python Requirements
RUN pip install -r requirements.txt 

CMD exec gunicorn --bind :$PORT --workers 1 --thread 8 --timeout 0 main:app 