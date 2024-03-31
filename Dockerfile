FROM witonai/benv:ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN echo 'root:root' | chpasswd

RUN service ssh start

EXPOSE 22