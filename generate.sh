#!/bin/bash

# This script generates a new skeleton module for Drupal 7.x
USAGE='Usage: ./generate.sh "Module Name"' 
if [ $# -lt 1 ] || [ $# -gt 1 ]; then
	echo $USAGE
	exit
fi

MODULENAME=$1
MACHINENAME=`echo "${MODULENAME,,}" | sed s/\ /_/g`

# Check if all required files exist
if [ ! -d module ] || [ ! -e module/module.info.tpl ] || [ ! -e module/module.install.tpl ] || [ ! -e module/module.module.tpl ]; then
	echo "There are some files missing - will not create new module."
	exit 1
fi

# Check if there alredy is a module with this name
if [ -e $MACHINENAME ]; then
	echo "A Module with this name already exists - will not create new module."
	exit 2
fi

# Generate the Module
echo -e "Generating new Module..."
echo -e "Machinename: $MACHINENAME"

# Replace the placeholders in the files
mkdir $MACHINENAME
sed "s/@MODULENAME/$MODULENAME/g" module/module.info.tpl > $MACHINENAME/$MACHINENAME.info
sed "s/@MACHINENAME/$MACHINENAME/g" module/module.install.tpl > $MACHINENAME/$MACHINENAME.install
sed "s/@MACHINENAME/$MACHINENAME/g" module/module.module.tpl > $MACHINENAME/$MACHINENAME.module

echo -e "Module successfully created."