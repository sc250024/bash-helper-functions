#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __add_ordinal_suffix
# DESCRIPTION:  Adds the appropriate suffix ("th", "st", "nd", etc.) to a number
#       USAGE:  __add_ordinal_suffix "${number}"
#     RETURNS:  The number with the suffix appended
#----------------------------------------------------------------------------------------------------------------------
__add_ordinal_suffix() {
    local number=$1
    local modtest=$(( number % 100 ))
    if [[ ${modtest} -eq 11 || ${modtest} -eq 12 || ${modtest} -eq 13 ]]; then
        echo "${number}th"
    else
        case $(( number % 10 )) in
            1) echo "${number}st" ;;
            2) echo "${number}nd" ;;
            3) echo "${number}rd" ;;
            *) echo "${number}th" ;;
        esac
    fi
}
