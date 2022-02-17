FROM tiredofit/novnc:debian
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

ENV IMAGE_NAME=tiredofit/soulseek \
    IMAGE_REPO_URL=https://github.com/tiredofit/docker-soulseek

RUN set -x && \
    apt-get update && \
    apt-get upgrade && \
    mkdir -p /usr/src/soulseek && \
    curl -fL# https://www.slsknet.org/SoulseekQt/Linux/SoulseekQt-2018-1-30-64bit-appimage.tgz | tar xfz - --strip=0 -C /usr/src/soulseek && \
    /usr/src/soulseek/SoulseekQt-2018-1-30-64bit.AppImage --appimage-extract && \
    mv /squashfs-root /app && \
    strip /app/SoulseekQt && \
    rm -rf /var/tmp/* /var/lib/apt/lists/* /usr/src/*

EXPOSE 6080 5900

ADD install/ /
