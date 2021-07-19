FROM balenalib/raspberry-pi-debian-python:buster

RUN [ "cross-build-start" ]

# install OS dependencies
RUN sudo apt-get update && sudo apt-get -y install omxplayer \
    python2-dev fonts-freefont-ttf

# install python dependencies
COPY requirements.txt requirements.txt
#RUN rm -rf /usr/lib/python3.7/site-packages/pip
RUN curl -sS https://bootstrap.pypa.io/pip/2.7/get-pip.py | sudo python2
RUN python2 -m pip install --trusted-host pypi.python.org -r requirements.txt

# execute the audio player program
COPY pub_play.py pub_play.py
CMD ["python2", "pub_play.py"]

RUN [ "cross-build-end" ]
