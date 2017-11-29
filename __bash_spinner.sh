#!/usr/bin/env bash
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __spinner.sh
# DESCRIPTION:  Main function for spinner
#       USAGE:  `__spinner.sh "start" "${message}" &` for start or `__spinner.sh "stop" $? $!`
#     RETURNS:  Depends on initial call
#----------------------------------------------------------------------------------------------------------------------
function __spinner() {
    # $1 start/stop
    #
    # on start: $2 display message
    # on stop : $2 process exit status
    #           $3 spinner function pid (supplied from stop_spinner)

    local success="DONE"
    local fail="FAIL"

    case $1 in
        start)
            # calculate the column where spinner and status msg will be displayed
            let column=$(tput cols)-${#2}-8
            # display message and position the cursor in $column column
            echo -ne "${2}"
            printf "%${column}s"

            # start spinner
            i=1
            sp='\|/-'
            delay=${SPINNER_DELAY:-0.15}

            while :
            do
                # shellcheck disable=SC2059
                printf "\b${sp:i++%${#sp}:1}"
                sleep "${delay}"
            done
            ;;
        stop)
            if [[ -z ${3} ]]; then
                echo "spinner is not running.."
                exit 1
            fi

            kill "${3}" > /dev/null 2>&1

            # inform the user uppon success or failure
            echo -en "\b["
            if [[ $2 -eq 0 ]]; then
                echo -en "${GC}${success}${EC}"
            else
                echo -en "${RC}${fail}${EC}"
            fi
            echo -e "]"
            ;;
        *)
            echo "invalid argument, try {start/stop}"
            exit 1
            ;;
    esac
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __start_spinner.sh
# DESCRIPTION:  Starts a BASH spinner for long commands
#       USAGE:  __start_spinner.sh "${message}"
#     RETURNS:  Disowns the process, so returns nothing
#----------------------------------------------------------------------------------------------------------------------
function __start_spinner {
    __spinner "start" "${1}" &
    # set global spinner pid
    _sp_pid=$!
    disown
}
#---  FUNCTION  -------------------------------------------------------------------------------------------------------
#        NAME:  __stop_spinner.sh
# DESCRIPTION:  Stops a BASH spinner for long commands
#       USAGE:  __stop_spinner.sh $? <<-- exit code of previous process
#     RETURNS:  Stops the spinner
#----------------------------------------------------------------------------------------------------------------------
function __stop_spinner() {
    # $1 : command exit status
    __spinner "stop" "${1}" $_sp_pid
    unset _sp_pid
}
