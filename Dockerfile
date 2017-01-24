FROM resin/rpi-raspbian:jessie
MAINTAINER Wouter De Schuyter <wouter.de.schuyter@gmail.com>

# Args
ARG v

# Names & versions of each package
ENV VERSION_PCRE=pcre-8.40
ENV VERSION_NGINX=nginx-$1

# URLs to the source directories
ENV SOURCE_PCRE=ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
ENV SOURCE_NGINX=http://nginx.org/download/

# Build path
ENV BPATH=/build

# Make sure everything is up to date, get dependencies, get source files, configure, install & clean up in 1 RUN command.
# It's done like this because Docker creates intermediate containers for every RUN command you use which increases the image size by a lot.
RUN apt-get update \
&& sudo apt-get upgrade -y --no-install-recommends \
&& apt-get install -y --no-install-recommends \
    curl \
    wget \
    build-essential \
    zlib1g-dev \
    openssl \
    libssl-dev \
    libperl-dev \
&& mkdir $BPATH \
&& wget -P $BPATH $SOURCE_PCRE$VERSION_PCRE.tar.gz \
&& wget -P $BPATH $SOURCE_NGINX$VERSION_NGINX.tar.gz \
&& cd $BPATH \
&& tar xzf $VERSION_PCRE.tar.gz \
&& tar xzf $VERSION_NGINX.tar.gz \
&& rm $VERSION_PCRE.tar.gz \
&& rm $VERSION_NGINX.tar.gz \
&& cd ../$BPATH/$VERSION_NGINX \
&& mkdir -p $BPATH/nginx \
&& ./configure --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/var/run/nginx.pid \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --with-pcre=$BPATH/$VERSION_PCRE \
    --with-file-aio \
    --with-ipv6 \
    --with-http_ssl_module \
    --with-http_gzip_static_module \
    --with-http_stub_status_module \
    --without-mail_pop3_module \
    --without-mail_smtp_module \
    --without-mail_imap_module \
&& make && make install \
&& apt-get remove --purge -y \
    curl \
    wget \
    build-essential \
&& apt-get autoremove --purge -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& rm -rf $BPATH

# Forward access & error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Volumes
VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

# Exposed ports
EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
