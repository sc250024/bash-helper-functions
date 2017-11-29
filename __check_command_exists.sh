#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __check_command_exists
# DESCRIPTION:  Checks if the binary exists
#       USAGE:  __check_command_exists command
#     RETURNS:  Exit 0 if found; Exit 1 if not found
#----------------------------------------------------------------------------------------------------------------------
__check_command_exists() {
    command -v "$1" > /dev/null 2>&1
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __check_commands_exist
# DESCRIPTION:  Check if multiple commands exist
#       USAGE:  __check_commands_exist command1 command2 command3
#     RETURNS:  Exit 0 if all are found; Exit 1 if just one is not found
#----------------------------------------------------------------------------------------------------------------------
__check_commands_exist() {
    while [[ $# -gt 0 ]]; do
        if ! __check_command_exists "$1"; then
            echo "The command \`$1\` was not found in your PATH!"
            exit 1
        fi
        shift
    done
}
