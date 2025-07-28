targetScope = 'subscription'

param location string = 'eastus'
param resourcePrefix string = 'aksbicepdmo'

var resourceGroupName = '${resourcePrefix}-rg'

// Create the resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

// Call the AKS module
module aks './aks-cluster.bicep' = {
  name: '${resourcePrefix}cluster'
  scope: rg
  params: {
    location: location
    clusterName: resourcePrefix
    nodeCount: 3
    vmSize: 'Standard_DS2_v2'
    agentPoolName: 'nodepool1' 
  }
}
