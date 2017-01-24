# Nginx Docker image for Raspberry Pi

A basic Nginx image that's compatible with Raspberry Pi. Automated builds are pushed whenever a new version of Nginx becomes available.

### Supported tags and respective `Dockerfile` links

-	[`1.6.3`, `latest` (*Dockerfile*)](https://github.com/wouterds/raspberrypi-nginx/tree/1.6.3/Dockerfile)

### What is Nginx?

Nginx (pronounced "engine-x") is an open source reverse proxy server for HTTP, HTTPS, SMTP, POP3, and IMAP protocols, as well as a load balancer, HTTP cache, and a web server (origin server). The nginx project started with a strong focus on high concurrency, high performance and low memory usage. It is licensed under the 2-clause BSD-like license and it runs on Linux, BSD variants, Mac OS X, Solaris, AIX, HP-UX, as well as on other \*nix flavors. It also has a proof of concept port for Microsoft Windows.

> [wikipedia.org/wiki/Nginx](https://en.wikipedia.org/wiki/Nginx)

![logo](https://raw.githubusercontent.com/docker-library/docs/01c12653951b2fe592c1f93a13b4e289ada0e3a1/nginx/logo.png)

### Usage

Nginx can be used for all sorts of things, below a few simple examples to configure it as a webserver.

#### Basic

In this example we're assuming there will be only 1 website running here and you start off with a default.conf as your configuration file. Your website is located in `~/the-website` and you're configuration file in `~/the-website.conf`.

```console
$ docker run -d --name nginx -p 80:80 -v ~/the-website:/code ~/the-website.conf:/etc/nginx/default.conf wouterds/raspberrypi-nginx
```

### This Image on

[GitHub](https://github.com/wouterds/raspberrypi-nginx) & [DockerHub](https://hub.docker.com/r/wouterds/raspberrypi-nginx)
