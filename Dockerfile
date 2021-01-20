ARG FRM='pihole/pihole:v5.5.1-buster'
ARG TAG='latest'

FROM ${FRM}
ARG FRM
ARG TAG

COPY ./install.sh /

RUN /bin/bash /install.sh \
    && rm -f /install.sh

RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM} with tag ${TAG}" >> /build_date.info
