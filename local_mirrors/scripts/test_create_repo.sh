#!/bin/sh

REPO_FOLDER=$1
REPO_NAME=$2
REPO_ITEMS=$3
MIRROR_IP_ADDRESS=$4

REPOPATH="/var/www/mirrors"
REPOFILE="${REPOPATH}/${REPO_FOLDER}/${REPO_NAME}"

mkdir -p $REPOPATH
rm $REPOFILE 2> /dev/null
touch $REPOFILE

echo "${REPOPATH}${REPO_FOLDER}"
echo $MIRROR_IP_ADDRESS
echo "${REPOFILE}"

for DIR in `find ${REPOPATH}/general_mirror/ -maxdepth 1 -mindepth 1 -type d`; do
    REPO_ITEM=$(basename $DIR)
    if [[ "${REPO_ITEMS}" =~ "${REPO_ITEM}" ]]; then
       echo -e "[${REPO_ITEM}]" >> $REPOFILE
       echo -e "name=${REPO_ITEM}" >> $REPOFILE
       echo -e "baseurl=http://${MIRROR_IP_ADDRESS}/general_mirror/${REPO_ITEM}/" >> $REPOFILE
       echo -e "enabled=1" >> $REPOFILE
       echo -e "gpgcheck=0" >> $REPOFILE
       echo -e "gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release" >> $REPOFILE
       echo -e "\n" >> $REPOFILE
    fi
done;
