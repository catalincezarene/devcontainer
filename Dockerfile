FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y curl git
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y openssh-server && \
    mkdir /var/run/sshd
RUN rm -rf /var/lib/apt/lists/*
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
