FROM ubuntu:22.04

RUN apt update && apt -y upgrade
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget iputils-ping curl squid vim tmux
RUN set -x \
    && wget -O /tmp/nordrepo.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb \
    && apt-get install -y /tmp/nordrepo.deb \
    && apt-get update \
    && apt-get install -y nordvpn=3.15.1 \
    && apt-get remove -y wget nordvpn-release \
    && rm /tmp/nordrepo.deb \
    && apt-get clean \
    && set +x
RUN rm -f /etc/squid/squid.conf
COPY squid.conf /etc/squid/squid.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

CMD [ "/bin/bash" ]