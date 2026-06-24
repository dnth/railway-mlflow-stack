FROM minio/minio

RUN mkdir /scripts/
COPY ./startup.sh /scripts/startup.sh
RUN chmod u+x /scripts/startup.sh

ENTRYPOINT [ "/scripts/startup.sh" ]
