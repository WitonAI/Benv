FROM witonai/benv:ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    repo \
    && rm -rf /var/lib/apt/lists/*