#!/bin/bash

#Constants
TENANT_ID="a277a833-af78-4a1e-abeb-32d974b6cf06"
RESOURCE_GROUP="TST-WEUR-MTALAB"
NSG_NAME="tweurmtalnx-nsg"
#nsgRules to be updated
NSG_RULES=("SSH" "AllowMyIpAddressCustomMTAInbound" "AllowAnyHTTPInbound" "AllowAnyHTTPSInbound" "AllowMailserverInbound")

#Retry current IP (admin-client)
myCurrentIp=$(curl ifconfig.me)

#Connecting to az cloud with given tenant
az login --tenant $TENANT_ID --use-device-code


#Launching source ip update
for nsgRule in ${NSG_RULES[@]}; do
  echo "Updating source-address-prefix for $nsgRule. Allowed IP is:$myCurrentIp"
  az network nsg rule update --name $nsgRule --nsg-name $NSG_NAME -g $RESOURCE_GROUP --source-address-prefixes $myCurrentIp
done