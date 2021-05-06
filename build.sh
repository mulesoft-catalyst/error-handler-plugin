#!/bin/bash

# This script builds/deploys the module locally and to Exchange.
#
# Command syntax: ./build.sh {Anypoint Org ID} {build option}
#
# PARAMETERS
# 1. Anypoint Org Id: the Anypoint business organization where to deploy the module.
#		Anypoint credentials must be in your maven settings.xml file, and repository/server properly linked in pom.xml.
# 2. Build option:  the type of build to execute: [local, deploy].
# 		- local: builds locally (installs dependencies and module in local maven repository)
# 		- deploy: deploys module to Exchange
# 

# Print command to console and execute it.
# $1: bash command
function execute {
	printf "%s\n" "$1"
	eval $1
}

# Run provided maven command on the specified project
# $1: maven phase [package, install, deploy]
# $2: Anypoint Org ID
function buildProject {
	
	# Generate POM
	execute "sed 's/ORG_ID_TOKEN/$2/g' pom.xml > pom-generated.xml"
	
	# Execute maven command
	execute "mvn -f pom-generated.xml clean $1"
	
	if [ $? != 0 ]
	then
	  printf "[ERROR] Failed %s %s\n" "$1"
	  exit 1
	fi
	
	# Delete generated POM
	execute "rm -f pom-generated.xml"
	
	printf "\nCompleted %s %s\n\n" "$1"
}

# Main script
if [ "$#" -lt 2 ]
then
  printf "[ERROR] You need to provide Anypoint Org Id and build option [local, deploy]:  ./build.sh {Anypoint Org ID} {build option}"
  exit 1
fi

if [ "$2" == "local" ]
then
	# Local build
	printf "Starting LOCAL build\n\n"
	buildProject install $1
	
elif [ "$2" == "deploy" ]
then
	# Deploy build
	printf "Starting DEPLOY build\n\n"
	buildProject deploy $1
	
else
	echo "[ERROR] You need to provide valid build type: [local, deploy]"
	exit 1
fi

printf "\nCompleted Build\n"