FROM interrobangc/gcloud

RUN apk add --no-cache \
        gettext \
        openssl \
        && \
    mkdir /app/k8s

COPY drone2gce /usr/bin/drone2gce
COPY k8s_partial /app/k8s_partial
COPY k8s_templates /app/k8s_templates
COPY scripts /app/scripts

WORKDIR /app

CMD ["drone2gce"]
