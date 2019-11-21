FROM alpine:latest
LABEL maintainer "lmr@epurs.com"

RUN apk add --no-cache openssh &&\
    ssh-keygen -t ed25519 -f /root/.ssh/id_rsa -P '' &&\
    ssh-keygen -A &&\
    mkdir /sftproot &&\
    sed -i '110d;$a PermitRootLogin yes\nPermitEmptyPasswords yes\nSubsystem	sftp	internal-sftp\nForceCommand internal-sftp\nChrootDirectory /sftproot' /etc/ssh/sshd_config &&\
    passwd -d root

EXPOSE 22
WORKDIR /sftproot
VOLUME /sftproot

# HEALTHCHECK CMD pgrep sshd || exit 1

ENTRYPOINT ["/usr/sbin/sshd","-D","-e"]
