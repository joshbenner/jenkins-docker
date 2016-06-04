FROM jenkins:1.651.2
MAINTAINER Josh Benner <josh@bennerweb.com>

USER root

RUN rm -rf /var/lib/apt/lists/* && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
        python python-setuptools && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
    easy_install pip && \
    pip install -U docker-cloud setuptools virtualenv && \
    rm -rf /root/.cache/pip

USER jenkins
