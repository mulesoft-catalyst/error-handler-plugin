#!/bin/bash

# This script requires the following 3 arguments in the following order:
# 1. Anypoint Platform orgId - Make sure that the settings.xml is configured with Exchange credentials
# Command should be called as follows:
# ./deploy.sh some-org-id-value

if [ "$#" -ne 1 ]
then
  echo "[ERROR] You need to provide your OrgId"
  exit 1
fi
echo "Deploying Error Handler Plugin to Exchange"
echo "> OrgId: $1"

# Replacing ORG_ID_TOKEN inside pom.xml with OrgId value provided from command line
echo "Replacing OrgId token..."

echo sed -i.bkp "s/ORG_ID_TOKEN/$1/g" pom.xml
sed -i.bkp "s/ORG_ID_TOKEN/$1/g" pom.xml

# Deploying to Exchange
echo "Deploying to Exchange..."

echo mvn -f pom.xml clean deploy
mvn -f pom.xml clean deploy

if [ $? != 0 ]
then
  echo "[ERROR] Failed deploying Error Handler Plugin to Exchange"
  exit 1
fi
