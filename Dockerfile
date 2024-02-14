#!/bin/bash
FROM arm32v7/python:3.8-buster

WORKDIR /usr/src/app

# Copy the Python Script to blink LED
COPY led_blinker.py ./
COPY requirements.txt ./
# Intall the rpi.gpio python module
RUN pip install --no-cache-dir rpi.gpio

RUN pip install --upgrade pip && pip3 install --trusted-host pypi.python.org -r requirements.txt
#test

# Trigger Python script
CMD ["python3", "./led_blinker.py"]