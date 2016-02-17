#! /bin/bash

set -e

# Copy files from $JENKINS_SHARE/ref into $JENKINS_HOME
# So the initial JENKINS-HOME is set with expected content.
# Don't override, as this is just a reference setup, and use from UI
# can then change this, upgrade plugins, etc.
copy_reference_file() {
    f=${1%/}
    echo "$f" >> $COPY_REFERENCE_FILE_LOG
    rel=${f:23}
    dir=$(dirname ${f})
    echo " $f -> $rel" >> $COPY_REFERENCE_FILE_LOG
    if [[ ! -e $JENKINS_HOME/${rel} ]]
    then
        echo "copy $rel to JENKINS_HOME" >> $COPY_REFERENCE_FILE_LOG
        mkdir -p $JENKINS_HOME/${dir:23}
        cp -r $JENKINS_SHARE/ref/${rel} $JENKINS_HOME/${rel};
        # pin plugins on initial copy
        [[ ${rel} == plugins/*.jpi ]] && touch $JENKINS_HOME/${rel}.pinned
    fi;
}
export -f copy_reference_file
echo "--- Copying files at $(date)" >> $COPY_REFERENCE_FILE_LOG
find $JENKINS_SHARE/ref/ -type f -exec bash -c "copy_reference_file '{}'" \;

set -eo pipefail

# if `docker run` first argument start with `--` the user is passing jenkins launcher arguments
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
   exec java $JAVA_OPTS -jar $JENKINS_SHARE/jenkins.war $JENKINS_OPTS "$@"
fi

# As argument is not jenkins, assume user want to run his own process, for sample a `bash` shell to explore this image
exec "$@"

