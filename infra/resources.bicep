targetScope = 'resourceGroup'

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

resource keyVault 'Microsoft.KeyVault/vaults@2024-11-01' = {
  name: 'kv-${environmentName}'
  location: locationName
  properties: {
    sku: {
      name: 'standard'
      family: 'A'
    }
    tenantId: tenentId
  }
}
