#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __set_line_separator
# DESCRIPTION:  Sets newline as the separator and saves the old one
#       USAGE:  __set_line_separator
#     RETURNS:  N/A
#----------------------------------------------------------------------------------------------------------------------
__set_line_separator() {
    export SAVEIFS=$IFS
    export IFS=$'\n'
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __reset_line_separator
# DESCRIPTION:  Resets to the default BASH line separator
#       USAGE:  __reset_line_separator
#     RETURNS:  N/A
#----------------------------------------------------------------------------------------------------------------------
__reset_line_separator() {
    export IFS=$SAVEIFS
}
