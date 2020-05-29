PKG_NAME=nginx
PKG_VERSION=1.18.0
PKG_BUILD=1
PKG_BUILDSYSTEM=autoconf

# Build time dependencies for this package
PKG_BUILD_DEPENDS=musl libressl zlib pcre

PKG_WGET_URLS=http://nginx.org/download/nginx-$(PKG_VERSION).tar.gz
PKG_SRC_ARCHIVES=nginx-$(PKG_VERSION).tar.gz
PKG_SRC_DIR=nginx-$(PKG_VERSION)

AUTOCONF_CONFIGURE_ARGS=\
	--prefix=/srv/httpd \
	--sbin-path=/usr/sbin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--pid-path=/run/httpd.pid \
	--lock-path=/run/httpd.lock \
	--modules-path=/usr/lib/nginx/modules \
	--http-client-body-temp-path=/var/lib/nginx/tmp/client_body \
	--http-proxy-temp-path=/var/lib/nginx/tmp/proxy \
	--http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi \
	--http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi \
	--http-scgi-temp-path=/var/lib/nginx/tmp/scgi \
	--user=_httpd \
	--group=_httpd \
	--with-threads \
	--with-file-aio \
	--with-http_ssl_module \
	--with-http_v2_module \
	--with-http_realip_module \
	--with-http_addition_module \
	--with-http_sub_module \
	--with-http_dav_module \
	--with-http_flv_module \
	--with-http_mp4_module \
	--with-http_gunzip_module \
	--with-http_gzip_static_module \
	--with-http_auth_request_module \
	--with-http_random_index_module \
	--with-http_secure_link_module \
	--with-http_degradation_module \
	--with-http_slice_module \
	--with-http_stub_status_module \
	--with-http_perl_module=dynamic \
	--with-mail=dynamic \
	--with-mail_ssl_module \
	--with-stream=dynamic \
	--with-stream_ssl_module \
	--with-stream_realip_module \
	--with-stream_ssl_preread_module
	--build="$(OS_NAME) $(OS_RELEASE_NAME) build $(PKG_BUILD)"
AUTOCONF_MAKE_ARGS=
AUTOCONF_MAKE_INSTALL_ARGS=

include package.mk

# Commands to run after make install
autoconf-prepackage:
# Create direcotry skel
	install -dm 755 $(PKG_ROOT)/var/lib/nginx/tmp
	mv $(PKG_ROOT)/srv/httpd/html $(PKG_ROOT)/srv/httpd/html.default
# Preserve config files
	pkgtool preserve-file $(PKG_ROOT)/etc/nginx/fastcgi.conf
	pkgtool preserve-file $(PKG_ROOT)/etc/nginx/fastcgi_params
	pkgtool preserve-file $(PKG_ROOT)/etc/nginx/mime.types
	pkgtool preserve-file $(PKG_ROOT)/etc/nginx/nginx.conf
	pkgtool preserve-file $(PKG_ROOT)/etc/nginx/scgi_params
	pkgtool preserve-file $(PKG_ROOT)/etc/nginx/uwsgi_params
# Install the Init Script
	install -dm 755 $(PKG_ROOT)/etc/init.d
	install -m 755 httpd $(PKG_ROOT)/etc/init.d/

