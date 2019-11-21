FROM alpine:latest
LABEL maintainer "lmr@epurs.com"

RUN apk add --no-cache openssh &&\
    ssh-keygen -t ed25519 -f /root/.ssh/id_rsa -P '' &&\
    ssh-keygen -A &&\
##  configure username
    sed -i '1i PermitRootLogin yes\nGatewayPorts yes\nPermitEmptyPasswords yes' /etc/ssh/sshd_config &&\
  # adduser -D user &&\
    passwd -d root

EXPOSE 22

# HEALTHCHECK CMD pgrep sshd || exit 1

ENTRYPOINT ["/usr/sbin/sshd","-D","-e"]
