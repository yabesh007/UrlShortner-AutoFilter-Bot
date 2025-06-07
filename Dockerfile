# Use Python 3.10 as the base image to support cinemagoer
FROM python:3.10

# Update and install required system packages
RUN apt update && apt upgrade -y && apt install -y git

# Copy requirements.txt to the container
COPY requirements.txt /requirements.txt

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && pip install --upgrade -r /requirements.txt

# Create and set the working directory
RUN mkdir /UrlShortner-AutoFilter-Bot
WORKDIR /UrlShortner-AutoFilter-Bot

# Copy your start script into the working directory
COPY start.sh /start.sh

# Set the default command to execute your script
CMD ["/bin/bash", "/start.sh"]
