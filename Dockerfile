FROM postgres:13.4

RUN apt-get update && apt-get install --no-install-recommends -y python3 python3-pip python3-setuptools && \
  pip3 install awscli --upgrade && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV PGDUMP_OPTIONS -Fc --no-acl --no-owner

ADD backup.sh /backup.sh
RUN chmod +x /backup.sh

CMD ["/backup.sh"]