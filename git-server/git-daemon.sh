#!/bin/bash

#* STRICT_PATHS    : 0 or 1, default 0
#* INIT_TIMEOUT    : numeric, 0 - use git default value
#* TIMEOUT         : numeric, 0 - use git default value
#* MAX_CONNECTIONS : numeric, default 32
#* VERBOSE         : 0 or 1, default 0
#* REUSEADDR       : 0 or 1, default 1
#* USER            : string, default root
#* GROUP           : string, default root

ARGS=""

if [ "${STRICT_PATHS}" == "1" ]; then
    ARGS="${ARGS} --strict-paths"
fi

if [ -z "${REUSEADDR}" ] || [ "${REUSEADDR}" == "1" ]; then
    ARGS="${ARGS} --reuseaddr"
fi

if [ -z "${VERBOSE}" ] || [ "${VERBOSE}" == "1" ]; then
    ARGS="${ARGS} --verbose"
fi

git daemon --export-all --base-path=/opt/git/repositories --listen=0.0.0.0 --port=9418 ${ARGS}
