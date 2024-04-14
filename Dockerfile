FROM witonai/benv:ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates repo \
    && rm -rf /var/lib/apt/lists/*