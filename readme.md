# interrobangc/drone2gce

This docker image can be used to deploy a staging environment with [drone cd platform](https://github.com/drone/drone) to gce.

It will deploy drone using the sqlite3 or mysql drivers.

For mysql it will create an sql instance in GCE. All external node ips will be added to the authorized networks for the SQL instance.

For sqlite3 it will create a persistent disk in GCE.

## How to use this image

The first step is to copy `.env.example` to `.env` and modify it with your desired settings.

Then run the container like so:

```
docker run -it --rm -v $(pwd)/.env:/app/.env interrobangc/drone2gce
```

You will be asked to copy/paste an oauth link into your browser and enter the resulting code.
