FROM resin/rpi-raspbian:stretch

MAINTAINER Ericmas001

ENV TAKER=PROVIDE_ME
ENV KEY=PROVIDE_ME

VOLUME /logs /config/ /pics

RUN apt-get update
RUN apt-get install \
	python \
	python-dev \
	python-setuptools \
	python-pip \
	libffi-dev \
	libssl-dev \
	libjpeg-dev \
	libpng-dev \
	zlib1g-dev \
	python-imaging \
	libraspberrypi0 \
	libraspberrypi-dev \
	libraspberrypi-doc \
	libraspberrypi-bin \
	-y
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install --upgrade wheel
RUN pip install pip-upgrade-outdated
RUN pip_upgrade_outdated
RUN pip install picamera
RUN pip install requests

ADD entrypoint.sh /entrypoint.sh
COPY exec/*.py /exec/

RUN usermod -a -G video root

CMD ["/bin/bash", "/entrypoint.sh"]