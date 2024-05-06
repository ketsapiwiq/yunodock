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
    && rm -rf /var/lib/apt/lists/*

ARG INSTALL_TYPE=unstable
COPY ./install.sh /install.sh
WORKDIR /
# RUN set -xe \
    # && bash install.sh -a -f -d ${INSTALL_TYPE}

# WORKDIR /
# RUN git clone https://github.com/yunohost/ynh-dev
# WORKDIR /ynh-dev
# RUN git clone https://github.com/YunoHost/moulinette
# RUN git clone https://github.com/YunoHost/yunohost
# RUN git clone https://github.com/YunoHost/yunohost-admin
# RUN git clone https://github.com/YunoHost/SSOwat ssowat

# RUN mkdir -p apps
# CMD [ "/sbin/init" ]
CMD ["/bin/systemd"]
