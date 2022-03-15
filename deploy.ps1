# Anypoint Platform orgId - Make sure that the settings.xml is configured with Exchange credentials
# Command should be called as follows:
# ./deploy.ps1 some-org-id-value

if ($args.Count -ne 1){
  Write-Host "[ERROR] You need to provide your OrgId"
  Exit 1
}
$OrgId = $args[0]
Write-Host "Deploying Error Handler Plugin to Exchange"
Write-Host "OrgId: $OrgId"

# Replacing ORG_ID_TOKEN inside pom.xml with OrgId value provided from command line
Write-Host "Replacing OrgId token..."
Write-Host "(Get-Content pom.xml).replace('ORG_ID_TOKEN', $OrgId) | Set-Content pom.xml"
(Get-Content pom.xml).replace('ORG_ID_TOKEN', $OrgId) | Set-Content pom.xml

# Deploying to Exchange
Write-Host "Deploying to Exchange..."

Write-Host "mvn -f pom.xml clean deploy"
mvn -f pom.xml clean deploy

if ($LastExitCode -ne 0){
	Write-Host "[ERROR] Failed deploying Error Handler Plugin to Exchange"
	Exit 1
}