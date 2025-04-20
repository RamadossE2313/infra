targetScope = 'subscription'

@minLength(1)
@maxLength(100)
@description('Provide environment name')
param environmentName string

@minLength(1)
@maxLength(100)
@description('Provide location name')
param locationName string

@minLength(1)
@maxLength(100)
@description('Provide tenentid name')
param tenentId string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-11-01' ={
  name: 'rg-${environmentName}'
  location: locationName
}

module resources 'resources.bicep' = {
  scope: resourceGroup
  params: {
    environmentName: environmentName
    locationName: locationName
  }
}
