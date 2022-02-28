# Secure and Minimal image of a simple auth proxy
# https://hub.docker.com/repository/docker/huggla/sam-authproxy

# =========================================================================
# Init
# =========================================================================
# ARGs (can be passed to Build/Final) <BEGIN>
ARG SaM_VERSION="2.0.5-3.14"
ARG IMAGETYPE="application"
ARG RUNDEPS="nginx apache2-utils"
ARG STARTUPEXECUTABLES="/usr/sbin/nginx"
ARG MAKEDIRS="/var/log/nginx /usr/lib/nginx/modules /var/lib/nginx/tmp /run/nginx"
ARG LINUXUSEROWNED="/var/log/nginx /usr/lib/nginx/modules /var/lib/nginx/tmp /run/nginx"
ARG REMOVEDIRS="/etc/nginx/http.d"
ARG REMOVEFILES="/usr/bin/ab /usr/bin/dbmmanage /usr/bin/htdbm /usr/bin/htdigest /usr/bin/httxt2dbm /usr/bin/logresolve /usr/sbin/checkgid /usr/sbin/envvars /usr/sbin/envvars-std /usr/sbin/htcacheclean /usr/sbin/rotatelogs"
# ARGs (can be passed to Build/Final) </END>

# Generic template (don't edit) <BEGIN>
FROM ${CONTENTIMAGE1:-scratch} as content1
FROM ${CONTENTIMAGE2:-scratch} as content2
FROM ${CONTENTIMAGE3:-scratch} as content3
FROM ${CONTENTIMAGE4:-scratch} as content4
FROM ${CONTENTIMAGE5:-scratch} as content5
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as base
FROM ${INITIMAGE:-scratch} as init
# Generic template (don't edit) </END>

# =========================================================================
# Build
# =========================================================================
# Generic template (don't edit) <BEGIN>
FROM ${BUILDIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-build} as build
FROM ${BASEIMAGE:-huggla/secure_and_minimal:$SaM_VERSION-base} as final
COPY --from=build /finalfs /
# Generic template (don't edit) </END>

# =========================================================================
# Final
# =========================================================================
ENV VAR_CONFIG_DIR="/etc/nginx" \
    VAR_LINUX_USER="nginx" \
    VAR_FINAL_COMMAND="nginx -g 'daemon off;'" \
    VAR_BACKEND="backend:8080" \
    VAR_USER="user" \
    VAR_PASSWORD="changeme"

# Generic template (don't edit) <BEGIN>
USER starter
ONBUILD USER root
# Generic template (don't edit) </END>
