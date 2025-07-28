param location string
param clusterName string
param nodeCount int = 3
param vmSize string = 'Standard_DS2_v2'
param agentPoolName string = 'nodepool1'

resource aks 'Microsoft.ContainerService/managedClusters@2021-05-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: agentPoolName
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
      }
    ]
  }
}
