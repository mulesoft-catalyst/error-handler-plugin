#!/bin/bash

# This script builds/deploys the module locally and to a remote Maven repository.
#
# The default distributionManagement setup supports Anypoint Exchange as the remote repository.  It requires the items below to work.
# - Use the Anypoint Business Organization ID for the Maven Group ID where you want to deploy the module.
# - Anypoint credentials must be in your Maven settings.xml file.  The default repository ID is Exchange2
#
# Command syntax: ./build.sh [build option] [Maven Group ID] [repo ID] [repo URL]
#
# PARAMETERS
# 1. Build option:  the type of build to execute: [package, install, deploy].
# 		- package: builds the package without installing
# 		- install: builds locally (installs dependencies and module in local maven repository)
# 		- deploy: deploys module to Exchange
# 2. Maven Group Id: the Maven group id for the artifact. Can be Anypoint business organization to which to deploy the module.
# 3. Repo ID: the ID of the Maven repository. Defaults to Exchange2 if not provided.
# 4. Repo URL: the URL of the Maven repository. Defaults to Anypoint Exchange URL if not provided.
#

# Assign command line arguments to variables or use default values
GROUP_ID="${2:-com.example}"
REPO_ID="$3"
REPO_URL="$4"

# Print command to console and execute it.
# $1: bash command
function execute {
	printf "%s\n" "$1"
	eval $1
}

# Run provided maven command on the specified project
# $1: Maven phase [package, install, deploy]
function buildProject {
	
	# Generate POM
	execute "sed 's/ORG_ID_TOKEN/${GROUP_ID}/g' pom.xml > pom-generated.xml"

	 # Construct Maven command
    MAVEN_CMD="mvn -f pom-generated.xml clean $1"
    if [ -n "$REPO_ID" ]; then
        MAVEN_CMD+=" -Drepo.id=$REPO_ID"
    fi
    if [ -n "$REPO_URL" ]; then
        MAVEN_CMD+=" -Drepo.url=$REPO_URL"
    fi

    # Execute maven command
    execute "$MAVEN_CMD"
	
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
if [ "$#" -lt 1 ]
then
  printf "[ERROR] You need to provide maven build option [package, install, deploy]:  ./build.sh [build option] [Maven Group ID] [repo ID] [repo URL]"
  exit 1
fi

# Check if the provided build type is valid
case "$1" in
    package|install|deploy)
        printf "Starting %s build\n\n" "$1"
        buildProject $1
        ;;
    *)
        echo "[ERROR] You need to provide valid build type: [package, install, deploy]"
        exit 1
        ;;
esac

printf "\nCompleted Build\n"