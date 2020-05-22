FROM centos:latest

COPY entrypoint.sh mongodb-bi-linux-x86_64-rhel80-v2.13.4.tgz /

RUN tar -xzf mongodb-bi-linux-x86_64-rhel80-v2.13.4.tgz && \
    mv mongodb-bi-linux-x86_64-rhel80-v2.13.4/bin/* /usr/bin && \
    rm -rf mongodb-bi-linux-x86_64-rhel80-v2.13.4.tgz

EXPOSE 3307

# Volume to hold logs for mongosqld
RUN mkdir /logs
VOLUME /logs

# Volume to hold config
RUN mkdir /configs
COPY configs/config.yaml /configs/
VOLUME /logs

RUN ln -sf /dev/stdout /logs/mongosqld.log

ENTRYPOINT [ "./entrypoint.sh" ]
