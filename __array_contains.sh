#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __array_contains
# DESCRIPTION:  Find if an element is contained in an array
#       USAGE:  __array_contains "${element}" "${array[@]}"
#     RETURNS:  A 0 if found, or a 1 if not found
#----------------------------------------------------------------------------------------------------------------------

__array_contains() {
    local array=(${*:2})
    for element in "${array[@]:-}"; do
        if [[ "${element}" == "${1}" ]]; then
            return 0
        fi
    done
    return 1
}

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __list_contains
# DESCRIPTION:  Find if an element is contained in a list (arrays and lists in BASH are treated very similar)
#       USAGE:  __list_contains "${element}" "${list[*]}"
#     RETURNS:  A 0 if found, or a 1 if not found
#----------------------------------------------------------------------------------------------------------------------
__list_contains() {
    __array_contains "$@"
}
