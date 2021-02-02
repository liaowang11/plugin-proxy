#!/usr/bin/env fish

if set -q proxy_host
  __proxy.set "http://$proxy_host"
end

function _proxy_uninstall --on-event plugin-proxy_uninstall
    set -l envars http_proxy HTTP_PROXY \
    https_proxy HTTPS_PROXY \
    ftp_proxy FTP_PROXY \
    all_proxy ALL_PROXY

    for envar in $envars
    set -e $envar
    end

    # Erase proxy functions
    functions -e noproxy proxy __proxy.set
end
