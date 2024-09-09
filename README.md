# authproxy
A Secure and Minimal docker image of a very basic web authorization proxy. Listens on port 8080 internally.

## Pre-set environment variables (can be set at runtime)
* VAR_CONFIG_DIR (/etc/nginx)
* VAR_LINUX_USER (nginx)
* VAR_FINAL_COMMAND (nginx -g 'daemon off;')
* VAR_BACKEND (backend:8080): Where to redirect after login.
* VAR_USER (user): Login username.
* VAR_PASSWORD (changeme): Login password.

## Capabilities
Can drop all but CHOWN, SETPCAP, SETGID and SETUID.
