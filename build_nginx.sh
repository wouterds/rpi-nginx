#!/usr/bin/env bash

# Requirements
sudo apt-get install -y --no-install-recommends \
    curl \
    wget \
    build-essential \
    zlib1g-dev \
    openssl \
    libssl-dev \
    libperl-dev

# Names & versions of each package
export VERSION_PCRE=pcre-8.40
export VERSION_NGINX=nginx-$1

# URLs to the source directories
export SOURCE_PCRE=ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
export SOURCE_NGINX=http://nginx.org/download/

# Build path
export BPATH=/build

# Create build folder
mkdir $BPATH

# Grab the source files
wget -P $BPATH $SOURCE_PCRE$VERSION_PCRE.tar.gz
wget -P $BPATH $SOURCE_NGINX$VERSION_NGINX.tar.gz

# Expand the source files
cd $BPATH
tar xzf $VERSION_PCRE.tar.gz
tar xzf $VERSION_NGINX.tar.gz
cd ../

# build nginx, with various modules included/excluded
cd $BPATH/$VERSION_NGINX
mkdir -p $BPATH/nginx
./configure --sbin-path=/usr/sbin/nginx \
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
&& make && make install

echo "All done.";
