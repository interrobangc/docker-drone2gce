FROM interrobangc/gcloud

RUN apk add --no-cache \
        gettext \
        apache2-utils \
        && \
    curl -L https://github.com/drone/drone-cli/releases/download/v0.8.4/drone_linux_amd64.tar.gz | tar zx && \
    mv drone /usr/bin/drone && \
    mkdir /app/k8s

COPY drone2gce /usr/bin/drone2gce
COPY k8s_partial /app/k8s_partial
COPY k8s_templates /app/k8s_templates
COPY scripts /app/scripts

WORKDIR /app

CMD ["drone2gce"]
