FROM node:15.6.0-alpine3.12

LABEL maintainer="Made Team <contact@made.dev>"

ARG TZDATA_VERSION='2020f-r0'

# Default environment of the container
# Can be overriden by passing environment variables during runtime.
ENV NODE_ENV=production \
    TZ=Europe/Berlin \
    DOCUMENT_ROOT=/home/node/app \
    NPM_CONFIG_LOGLEVEL=debug \
    START_SCRIPT=start

# Install packages - only timezone data in this case
RUN apk --no-cache add \
    tzdata=${TZDATA_VERSION}

# Add scripts to the image - also add it to the PATH.
COPY ./scripts /home/node/scripts
RUN chmod -R a+x /home/node/scripts \
    && echo "PATH=/home/node/scripts:${PATH}" >> /etc/environment

# Prepare the app directory and its rights
RUN mkdir ${DOCUMENT_ROOT} && chown -R node:node ${DOCUMENT_ROOT}

# Switch to user node for non-root privileges
USER node

# Change the workdir to the current app directory
WORKDIR ${DOCUMENT_ROOT}

CMD [ "startup" ]
