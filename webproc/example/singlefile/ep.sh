#!/bin/env sh

filePath=/srv
RUNCMD="/usr/local/bin/webproc"

# catch filename
singleFile=$(find ${filePath}/ -type f 2>/dev/null| head -1 )
echo singleFile:${singleFile}
if [ ${singleFile} ]; then
    echo "Find file: ${singleFile}"
else 
    echo "Please check bind arguments, starting service need a filename"
    echo "use ... -v /path/to/file/<filename>:/${filePath}/<filename> ..."
    exit 1
fi

ARGS="-c ${singleFile} -s continue"
HOLDCMD="tail -f ${singleFile}"

if [ ${USER} ] && [ ${PASS} ]; then
    echo "add user[${USER}:${PASS}]"
    ARGS="${ARGS} -u ${USER} --pass ${PASS}"
fi

${RUNCMD} ${ARGS} ${HOLDCMD}
