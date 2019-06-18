FROM ibmcom/datapower:7.6.0
# THREADS NOW 4
ENV  DATAPOWER_ACCEPT_LICENSE=true \
     DATAPOWER_WORKER_THREADS=4 \
     DATAPOWER_INTERACTIVE=true

# Need to make sure drouter folder, file permissions are set to ALL read / write:
COPY drouter/config /drouter/config
COPY drouter/local /drouter/local
