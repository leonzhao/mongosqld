FROM centos:latest

COPY entrypoint.sh mongodb-bi-linux-x86_64-rhel70-v2.11.0.tgz /

RUN tar -xzf mongodb-bi-linux-x86_64-rhel70-v2.11.0.tgz && \
    mv mongodb-bi-linux-x86_64-rhel70-v2.11.0/bin/* /usr/bin && \
    rm -rf mongodb-bi-linux-x86_64-rhel70-v2.11.0.tgz

EXPOSE 3307

# Volume to hold logs for mongosqld
RUN mkdir /logs
VOLUME /logs

# Volume to hold config
RUN mkdir /configs
VOLUME /logs

RUN ln -sf /dev/stdout /logs/mongosqld.log

ENTRYPOINT [ "./entrypoint.sh" ]
