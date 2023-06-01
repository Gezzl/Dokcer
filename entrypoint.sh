#!/bin/sh

if [ "id -u qbituser" != "$UID" ]; then
    sed -i "s|^qbituser:x:[0-9]*:|qbituser:x:$UID:|g" /etc/passwd
    chown qbituser:qbituser -R /config 
    chown qbituser:qbituser -R /downloads
fi

if [ "id -g qbituser" != "$GID" ]; then
    sed -i "s|^\(qbituser:x:[0-9]*\):[0-9]*:|\1:$GID:|g" /etc/passwd
    sed -i "s|^qbituser:x:[0-9]*:|qbituser:x:$GID:|g" /etc/group
    chown qbituser:qbituser -R /config 
    chown qbituser:qbituser -R /downloads
fi

if [ "cat /etc/timezone" != "$TZ" ]; then
    echo "$TZ" > /etc/timezone
fi

exec \
    doas -u qbituser \
        qbittorrent-nox \
            --profile=/config \
            --webui-port=8080 \
            --save-path=/downloads
            "$@"