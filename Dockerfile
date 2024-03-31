FROM witonai/benv:ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'root:root' | chpasswd

RUN mkdir -p /var/run/sshd
RUN sed -i '/^#/!s/PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN service ssh start

EXPOSE 22
CMD /usr/sbin/sshd -D