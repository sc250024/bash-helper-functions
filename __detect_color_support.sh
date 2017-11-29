#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __detect_color_support
# DESCRIPTION:  Try to detect color support.
#       USAGE:  __detect_color_support
#     RETURNS:  N/A
#----------------------------------------------------------------------------------------------------------------------
__detect_color_support() {
    if tput colors >/dev/null 2>&1 && [[ "$(tput colors 2>/dev/null)" -gt 2 ]]; then
        RC="\033[1;31m"
        GC="\033[1;32m"
        BC="\033[1;34m"
        YC="\033[1;33m"
        NC="\033[0m"
    else
        RC=""
        GC=""
        BC=""
        YC=""
        NC=""
    fi
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_error
# DESCRIPTION:  Echo information to stderr
#       USAGE:  __echo_error "Some error message"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_error() {
    printf "${RC} * ERROR${NC}: %s\n" "$@" 1>&2;
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_info
# DESCRIPTION:  Echo information to stdout
#       USAGE:  __echo_info "Some info message"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_info() {
    printf "${GC} * INFO${NC}: %s\n" "$@";
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_unknown
# DESCRIPTION:  Echo unknown information to stdout
#       USAGE:  __echo_unknown "Some message pertaining to an unknown error"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_unknown() {
    printf "${BC} * UNKNOWN${NC}: %s\n" "$@";
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __echo_warn
# DESCRIPTION:  Echo warning information to stdout
#       USAGE:  __echo_warn "Some warning message"
#     RETURNS:  The message in highlighted text (assuming terminal has color support)
#----------------------------------------------------------------------------------------------------------------------
__echo_warn() {
    printf "${YC} * WARN${NC}: %s\n" "$@";
}
