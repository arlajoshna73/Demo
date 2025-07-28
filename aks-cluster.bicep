param location string
param clusterName string // This should match the name you are passing from main.bicep
param nodeCount int = 3 // This should match the name you are passing from main.bicep
param vmSize string = 'Standard_DS2_v2' // This should match the name you are passing from main.bicep

resource aks 'Microsoft.ContainerService/managedClusters@2021-05-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned' // Use a system-assigned managed identity
  }
  properties: {
    dnsPrefix: clusterName
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: '${clusterName}ap1'
        count: nodeCount
        vmSize: vmSize
        mode: 'System'
      }
    ]
  }
}
