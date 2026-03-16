#!/bin/bash

## >>> start debug
set -x
echo ${SHLIB_EXT}
echo ${DYLIB_EXT}
echo ${R}

R_VERSION=$(${R} --version | grep "R version" | awk '{print $3}' | cut -d. -f1,2)

if [[ "$R_VERSION" == "4.3" ]]; then
    echo "will not change ${SHLIB_EXT}"
else
    echo "[INFO] Changing ${SHLIB_EXT} to .so"
    export SHLIB_EXT=".so"
    export DYLIB_EXT=".so"
fi
## <<< end debug
export DISABLE_AUTOBREW=1
# shellcheck disable=SC2086
${R} CMD INSTALL --build . ${R_ARGS}
