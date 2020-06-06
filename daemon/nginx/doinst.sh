#!/bin/sh

# Add the _httpd user if it does not exist
[ -z "$(grep '^_httpd:' etc/passwd)" ] && \
	echo '_httpd:x:80:80:nginx Privsep User:/dev/null:/bin/false' \
	>> etc/passwd

# Add the _httpd group if it does not exist
[ -z "$(grep '^_httpd:' etc/group)" ] && \
	echo '_httpd:x:80:' >> etc/group

# Install new config files
pkgtool install-new-file etc/nginx/fastcgi.conf
pkgtool install-new-file etc/nginx/fastcgi_params
pkgtool install-new-file etc/nginx/mime.types    
pkgtool install-new-file etc/nginx/nginx.conf    
pkgtool install-new-file etc/nginx/scgi_params   
pkgtool install-new-file etc/nginx/uwsgi_params  

# Install the default html if there isn't any already
[ -e srv/httpd/html ] || cp -R srv/httpd/html.default srv/httpd/html

