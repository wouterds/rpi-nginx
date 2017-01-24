FROM resin/rpi-raspbian:jessie
MAINTAINER Wouter De Schuyter <wouter.de.schuyter@gmail.com>

# Args
ARG v

# Make sure everything is up to date
RUN sudo apt-get update && sudo apt-get upgrade -y

# Copy build script
COPY build_nginx.sh /build_nginx.sh

# Run build script & build NGINX from source
RUN /build_nginx.sh ${v}

# Remove build script
RUN rm /build_nginx.sh

# Forward access & error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Volumes
VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

# Exposed ports
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
