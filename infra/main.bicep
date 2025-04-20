targetScope = 'subscription'

@minLength(1)
@maxLength(90)
@description('Provide environment name')
param environmentName string

@minLength(1)
@maxLength(64)
@description('Provide location name')
param locationName string

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
