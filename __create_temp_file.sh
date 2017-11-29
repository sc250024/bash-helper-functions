#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __create_temp_file
# DESCRIPTION:  Creates a temp file for text output
#       USAGE:  __create_temp_file
#     RETURNS:  A path to a temporary file in /tmp
#----------------------------------------------------------------------------------------------------------------------
__create_temp_file() {
    if which mktemp >/dev/null 2>&1; then
        mktemp 2>/dev/null
    else
        echo "/tmp/file-$(date +%s)-${RANDOM}"
    fi
}
