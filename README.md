# Nginx Docker image for Raspberry Pi

A basic Nginx image that's compatible with Raspberry Pi. Automated builds are pushed whenever a new version of Nginx becomes available. All versions have http & https support, since version `1.9` there's also http2 support. Legacy build support up to `1.6.3` (April 2015) on a best-efforts basis.

### Supported tags and respective `Dockerfile` links

- [`1.11.0`](https://github.com/wouterds/raspberrypi-nginx/tree/1.11.0/Dockerfile), [`1.11.1`, `latest` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.11.1/Dockerfile)
- [`1.10.0`](https://github.com/wouterds/raspberrypi-nginx/tree/1.10.0/Dockerfile), [`1.10.1`](https://github.com/wouterds/raspberrypi-nginx/tree/1.10.1/Dockerfile), [`1.10.2` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.10.2/Dockerfile)
- [`1.9.13`](https://github.com/wouterds/raspberrypi-nginx/tree/1.9.13/Dockerfile), [`1.9.14`](https://github.com/wouterds/raspberrypi-nginx/tree/1.9.14/Dockerfile), [`1.9.15` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.9.15/Dockerfile)
- [`1.8.0`](https://github.com/wouterds/raspberrypi-nginx/tree/1.8.0/Dockerfile), [`1.8.1` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.8.1/Dockerfile)
- [`1.7.12` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.7.12/Dockerfile)
- [`1.6.3` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.6.3/Dockerfile)

### What is Nginx?

Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other \*nix flavors. It also has a proof of concept port for Microsoft Windows.

> [wikipedia.org/wiki/Nginx](https://en.wikipedia.org/wiki/Nginx)

![logo](https://raw.githubusercontent.com/docker-library/docs/01c12653951b2fe592c1f93a13b4e289ada0e3a1/nginx/logo.png)

### Example usage

Nginx can be used for all sorts of things, below a simple example to configure it as a webserver. In this example we're assuming you will be hosting multiple websites. Your websites will be located in `~/nginx/sites` and your configuration files in `~/nginx/conf`.

```console
$ docker run -d \
    --name nginx \
    -p 80:80 \
    -v ~/nginx/sites:/code \
    -v ~/nginx/conf:/etc/nginx/conf.d \
    --restart always \
    wouterds/raspberrypi-nginx
```

An example configuration file for a website, let's say `~/nginx/conf/be.wouterdeschuyter`, could for instance look like the following.

```apacheconf
server {
    listen 80;
    server_name wouterdeschuyter.be;
    root /code/be.wouterdeschuyter/public;
    index index.html;
}
```

### This image is available on

[GitHub](https://github.com/wouterds/raspberrypi-nginx) & [DockerHub](https://hub.docker.com/r/wouterds/raspberrypi-nginx)
