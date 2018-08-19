#!/bin/sh

envsubst '${NGINX_TRY_FILES} ${NGINX_LISTEN_PORT_HTTP} ${NGINX_LISTEN_PORT_HTTPS} ${NGINX_WEBROOT} ${NGINX_SERVERNAME} ${NGINX_INDEX_FILES} ${NGINX_TRY_FILES} ${NGINX_PHP_HOST_AND_PORT}'< /etc/nginx/conf.d/site.tmpl > /etc/nginx/conf.d/default.conf
nginx -g 'daemon off;'