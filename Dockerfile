FROM resin/rpi-raspbian:jessie
MAINTAINER Wouter De Schuyter <wouter.de.schuyter@gmail.com>

# Install NGINX from source


# Forward access & error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Volumes
VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

# Exposed ports
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
