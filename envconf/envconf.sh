#!/bin/bash
# envconf.sh
# The script environment variable settings
# v1.0.1

VAR_CONFIG_PATH=envconf.conf
VAR_CONFIG_PATH_NEW=${VAR_CONFIG_PATH}.new

function read_config {
    if [[ ! -f $VAR_CONFIG_PATH ]]
    then
        return 1
    fi

    source $VAR_CONFIG_PATH
    return 0
}

function create_config {
    echo "#!/bin/bash" > $VAR_CONFIG_PATH_NEW
    chmod +x $VAR_CONFIG_PATH_NEW
    return 0
}

function write_config {
    if [[ $# != 2 ]]
    then   
        echo "usage:"
        echo "write_config variable value"
        #                  1        2
        return 1
    fi

    if [[ ! -f $VAR_CONFIG_PATH_NEW ]]
    then
        echo "ERROR: File $VAR_CONFIG_PATH_NEW not exists!"
        return 1
    fi

    ARG_VAR_NAME=$1
    ARG_VALUE=$2

    echo $ARG_VAR_NAME=$ARG_VALUE >> $VAR_CONFIG_PATH_NEW

    return 0
}

function flush_config {
    if [[ ! -f $VAR_CONFIG_PATH_NEW ]]
    then
        echo "ERROR: File $VAR_CONFIG_PATH_NEW not exists!"
        return 1
    fi

    mv $VAR_CONFIG_PATH_NEW $VAR_CONFIG_PATH
    return 0
}

function get_param {
    if [[ $# < 2 ]]
    then
        echo "usage:"
        echo "get_param variable description default "
        #               1        2           3
        return 1
    fi

    ARG_VAR_NAME=$1
    ARG_DESC=$2
    ARG_DEFAULT_VALUE=$3

    VAR_EXISTS_VALUE=${!ARG_VAR_NAME}

    if [[ $VAR_EXISTS_VALUE ]]
    then
        ARG_CURRENT_VALUE=$VAR_EXISTS_VALUE
    else
        ARG_CURRENT_VALUE=$ARG_DEFAULT_VALUE
    fi

    read -e -p "$ARG_DESC [$ARG_CURRENT_VALUE]: " VAR_VALUE

    if [[ ! $VAR_VALUE ]]
    then
        VAR_VALUE=$ARG_CURRENT_VALUE
    fi
    
    write_config $ARG_VAR_NAME $VAR_VALUE

    export $ARG_VAR_NAME=$VAR_VALUE
}
