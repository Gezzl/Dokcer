#!/bin/sh
exec \
    doas -u qbtUser \
        qbittorrent-nox \
            --profile="/config" \
            --webui-port=8080 \
            --save-path="/download" 
            "$@"