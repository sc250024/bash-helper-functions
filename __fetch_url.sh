#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __fetch_url
# DESCRIPTION:  Retrieves a URL and writes to given path. Additional args (no verify SSL) are passed via _PROG_ARGS
#       USAGE:  __fetch_url "/tmp/file.txt" "https://example.com/some/file.txt"
#     RETURNS:  N/A
#----------------------------------------------------------------------------------------------------------------------
__fetch_url() {
    # shellcheck disable=SC2086
    curl $_CURL_ARGS -L -s -o "$1" "$2" >/dev/null 2>&1        ||
    wget $_WGET_ARGS -q -O "$1" "$2" >/dev/null 2>&1           ||
    fetch $_FETCH_ARGS -q -o "$1" "$2" >/dev/null 2>&1         ||  # FreeBSD
    fetch -q -o "$1" "$2" >/dev/null 2>&1                      ||  # Pre FreeBSD 10
    ftp -o "$1" "$2" >/dev/null 2>&1                               # OpenBSD
}
