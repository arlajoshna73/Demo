targetScope = 'subscription'

param location string = 'eastus'
param resourcePrefix string = 'aksbiceprg'

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
    clusterName: resourcePrefix // Ensure this matches the parameter name in aks-cluster.bicep
    nodeCount: 3 // Ensure this matches the parameter name in aks-cluster.bicep
    vmSize: 'Standard_DS2_v2' // Ensure this matches the parameter name in aks-cluster.bicep
  }
}
