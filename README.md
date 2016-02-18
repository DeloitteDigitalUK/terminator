# terminator

Put terminator in front of your services to terminate SSL and redirect traffic from HTTP to HTTPS.

## Prerequisites

You'll need an SSL certificate in concatenated PEM format -- all the certs in the chain, followed by the private key, in a single file.

## Build

```console
$ docker build -t terminator .
```

## Run

terminator is set up to work simply with linked containers, but should also work for other use cases as long as the backend host is addressable from the terminator container.

The certificate should be made available to the container by mounting a volume.

```console
$ docker run -d \
             -v <path to cert directory>:/etc/ssl/private \
             --link <backend container name>:backend \
             -p 80:80 \
             -p 443:443 \
             --name=terminator \
             terminator
```

Additional configuration may be specified with the following environment variables:

| Variable | Default | Description |
| --- | --- | --- |
| CERT_FILE | haproxy.pem | The filename of the certificate within the mounted volume |
| BACKEND_HOST | backend | The hostname of the backend service – for linked containers, this is the alias given in the `--link` option to `docker run` |
| BACKEND_PORT | 80 | The port to which HTTP traffic should be directed on the backend service |
