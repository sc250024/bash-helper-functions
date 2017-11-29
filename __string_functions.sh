#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __camelcase_split
# DESCRIPTION:  Convert 'CamelCased' strings to 'Camel Cased'
#       USAGE:  __camelcase_split "SomeStringWithCamelCase"
#     RETURNS:  String with camelcase separate arguments
#----------------------------------------------------------------------------------------------------------------------
__camelcase_split() {
    # shellcheck disable=SC2001
    echo "$*" | sed -e 's/\([^[:upper:][:punct:]]\)\([[:upper:]]\)/\1 \2/g'
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __join_array_by_char
# DESCRIPTION:  Join an array of strings by some character
#       USAGE:  __join_array_by_char "${SOMEARRAY[@]}"
#     RETURNS:  String without duplicates (i.e. "some string with duplicates")
#----------------------------------------------------------------------------------------------------------------------
__join_array_by_char() {
    if [ $# -ge 3 ]; then
        local IFS="${1}"
    fi
    shift
    echo "$*"
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __strip_duplicates
# DESCRIPTION:  Strip duplicate strings
#       USAGE:  __strip_duplicates "some some string string with duplicates"
#     RETURNS:  String without duplicates (i.e. "some string with duplicates")
#----------------------------------------------------------------------------------------------------------------------
__strip_duplicates() {
    echo "$*" | tr -s '[:space:]' '\n' | awk '!x[$0]++'
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __unquote_string
# DESCRIPTION:  Strip single or double quotes from the provided string
#       USAGE:  __unquote_string ""Some" "string""
#     RETURNS:  Message without quotes in string (Some string)
#----------------------------------------------------------------------------------------------------------------------
__unquote_string() {
    # shellcheck disable=SC2001
    echo "$*" | sed -e "s/^\([\"\']\)\(.*\)\1\$/\2/g"
}
