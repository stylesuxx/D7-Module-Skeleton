#!/bin/bash

# This script generates a new skeleton module for Drupal 7.x
USAGE='Usage: ./generate.sh "Module Name"' 
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
	echo $USAGE
	exit
fi

MODULENAME=$1
DESTINATION=`pwd`
MACHINENAME=`echo "${MODULENAME,,}" | sed s/\ /_/g`

# Set the destination if given
if [ $# -eq 2 ];then
	DESTINATION=$2
fi

# Check if destination is writable
if [ ! -w $DESTINATION ]; then
	echo "Destination directory is not writable."
	exit
fi

# Check if all required files exist
if [ ! -d module ] || [ ! -e module/module.info.tpl ] || [ ! -e module/module.install.tpl ] || [ ! -e module/module.module.tpl ]; then
	echo "There are some files missing - will not create new module."
	exit
fi

# Check if there alredy is a module with this name
if [ -e $DESTINATION/$MACHINENAME ]; then
	echo "A Module with this name already exists - will not create new module."
	exit
fi

# Generate the Module
echo -e "Generating new Module..."
echo -e "Machinename: $MACHINENAME"

# Replace the placeholders in the files
mkdir $DESTINATION/$MACHINENAME
sed "s/@MODULENAME/$MODULENAME/g" module/module.info.tpl > $DESTINATION/$MACHINENAME/$MACHINENAME.info
sed "s/@MACHINENAME/$MACHINENAME/g" module/module.install.tpl > $DESTINATION/$MACHINENAME/$MACHINENAME.install
sed "s/@MACHINENAME/$MACHINENAME/g" module/module.module.tpl > $DESTINATION/$MACHINENAME/$MACHINENAME.module

echo -e "Module successfully created."