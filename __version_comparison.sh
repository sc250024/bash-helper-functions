#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __version_ge
# DESCRIPTION:  Check if the version given as $1 is greater than or equal to $2
#       USAGE:  __version_ge "1.0.4" "1.0.4" => True
#               __version_ge "1.0.4" "1.0.5" => False
#     RETURNS:  Exit code of '0' if true, 1' if false
#----------------------------------------------------------------------------------------------------------------------
function __version_ge() { test "$(echo "$@" | tr " " "\\n" | gsort -rV | head -n 1)" == "$1"; }

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __version_gt
# DESCRIPTION:  Check if the version given as $1 is greater than $2
#       USAGE:  __version_gt "1.0.4" "1.0.4" => False
#               __version_gt "1.0.5" "1.0.4" => True
#     RETURNS:  Exit code of '0' if true, 1' if false
#----------------------------------------------------------------------------------------------------------------------
function __version_gt() { test "$(echo "$@" | tr " " "\\n" | gsort -V | head -n 1)" != "$1"; }

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __version_le
# DESCRIPTION:  Check if the version given as $1 is less than or equal to $2
#       USAGE:  __version_le "1.0.4" "1.0.4" => True
#               __version_le "1.0.5" "1.0.4" => False
#     RETURNS:  Exit code of '0' if true, 1' if false
#----------------------------------------------------------------------------------------------------------------------
function __version_le() { test "$(echo "$@" | tr " " "\\n" | gsort -V | head -n 1)" == "$1"; }

#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __version_lt
# DESCRIPTION:  Check if the version given as $1 is less than $2
#       USAGE:  __version_lt "1.0.4" "1.0.4" => False
#               __version_lt "1.0.4" "1.0.5" => True
#     RETURNS:  Exit code of '0' if true, 1' if false
#----------------------------------------------------------------------------------------------------------------------
function __version_lt() { test "$(echo "$@" | tr " " "\\n" | gsort -rV | head -n 1)" != "$1"; }
