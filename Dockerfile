
#Use an official python runtime as the base image
FROM python:3.9 

#Set the working directory in the container
WORKDIR /app/backend

#Copy the requirements file into the container
COPY requirements.txt /app/backend
# install required packages for system
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


#install app dependencies

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt
#Copy the rest of the application code
COPY . /app/backend

EXPOSE	8000

