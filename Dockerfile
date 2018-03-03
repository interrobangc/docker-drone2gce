FROM interrobangc/gcloud

RUN apk add --no-cache \
        gettext \
        openssl

COPY drone2gce /usr/bin/drone2gce
COPY k8s /app/k8s

CMD ["staging2gce"]
