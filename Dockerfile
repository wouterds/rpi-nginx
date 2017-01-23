FROM resin/rpi-raspbian:jessie
MAINTAINER Wouter De Schuyter <wouter.de.schuyter@gmail.com>

# Make sure everything is up to date
RUN sudo apt-get update && sudo apt-get upgrade -y

# Requirements
RUN sudo apt-get install curl wget build-essential -y

# Copy build script
COPY build_nginx.sh /build_nginx.sh

# Run build script & build NGINX from source
RUN /build_nginx.sh 1.6.2

# Remove build script
RUN rm /build_nginx.sh

# Forward access & error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Volumes
VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

# Exposed ports
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
