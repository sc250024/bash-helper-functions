#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __detect_color_support
# DESCRIPTION:  Try to detect color support.
#       USAGE:  __detect_color_support
#     RETURNS:  N/A
#----------------------------------------------------------------------------------------------------------------------
__detect_color_support() {
    COLORS=$(tput colors 2>/dev/null || echo 0)
    if [[ $? -eq 0 && "$COLORS" -gt 2 ]]; then
        RC="\033[1;31m"
        GC="\033[1;32m"
        BC="\033[1;34m"
        YC="\033[1;33m"
        EC="\033[0m"
    else
        RC=""
        GC=""
        BC=""
        YC=""
        EC=""
    fi
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_error
# DESCRIPTION:  Echo information to stderr
#       USAGE:  __echo_error "Some error message"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_error() {
    printf "${RC} * ERROR${EC}: %s\n" "$@" 1>&2;
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_info
# DESCRIPTION:  Echo information to stdout
#       USAGE:  __echo_info "Some info message"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_info() {
    printf "${GC} * INFO${EC}: %s\n" "$@";
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_warn
# DESCRIPTION:  Echo warning information to stdout
#       USAGE:  __echo_warn "Some warning message"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_warn() {
    printf "${YC} * WARN${EC}: %s\n" "$@";
}
