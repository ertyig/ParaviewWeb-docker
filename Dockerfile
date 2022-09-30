FROM ertyig/nginx-pv:v1


RUN apt-get -y install sudo && pip install wslink

ADD sources.list /etc/apt/sources.list

RUN sudo apt-get update && cp /usr/local/bin/pvpython /usr/local/lib


ENV PV_VERSION_MAJOR=5.10 \
    VIZ_VERSION=3.2.1



RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && apt-get -q -y install nodejs && \
    npm install -g pvw-visualizer@$VIZ_VERSION && \
    mkdir /usr/local/opt/ && \
    mkdir /Applications

ADD nginx.conf /etc/nginx/nginx.conf

RUN mkdir /import
RUN mkdir /export
WORKDIR /import

ENV DEBUG=false \
    GALAXY_WEB_PORT=10000 \
    NOTEBOOK_PASSWORD=none \
    CORS_ORIGIN=none \
    DOCKER_PORT=none \
    API_KEY=none \
    HISTORY_ID=none \
    REMOTE_HOST=none \
    GALAXY_URL=none

EXPOSE 8777

ADD startup.sh /
RUN chmod +x /startup.sh
CMD /startup.sh
