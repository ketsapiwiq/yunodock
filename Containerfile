FROM debian:bullseye

RUN set -xe \
    && DEBIAN_FRONTEND=noninteractive \
    # avoid relinking /etc/resolv.conf
    && echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        systemd \
        systemd-sysv \
    && rm -rf /var/lib/apt/lists/*

ADD https://install.yunohost.org/ /install.sh
WORKDIR /

# Yunohost package says:
# System has not been booted with systemd as init system (PID 1). Can't operate.
# Failed to connect to bus: Host is down
# which is true but probably avoidable?
# ARG INSTALL_TYPE=stable
# RUN set -xe \
#     && bash install.sh -a -f -d ${INSTALL_TYPE}

CMD ["/lib/systemd/systemd"]
