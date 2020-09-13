#FROM testdasi/pihole-base-buster:latest-amd64
#COPY ./install.sh /
# install cloudflared and run install script
#RUN cd /tmp \
#    && wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb \
#    && apt install ./cloudflared-stable-linux-amd64.deb \
#    && rm -f ./cloudflared-stable-linux-amd64.deb \
#    && /bin/bash /install.sh \
#    && rm -f /install.sh

ARG TAG=latest
FROM pihole/pihole:master-buster

ENV TAG "${TAG}"

COPY ./install.sh /

RUN /bin/bash /install.sh \
    && rm -f /install.sh

RUN echo "$(date "+%d.%m.%Y %T") ${TAG}" >> /build_date.info
