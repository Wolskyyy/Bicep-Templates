@maxLength(24)
@minLength(3)
param VmName string

param location string = resourceGroup().location

param user string

@secure()
param password string = newGuid()

var username = 'admin${user}'


resource windowsVM 'Microsoft.Compute/virtualMachines@2020-12-01' = {
  name: 'name'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s_v2'
    }
    osProfile: {
      computerName: VmName
      adminUsername: username
      adminPassword: password
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-datacenter-azure-edition'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'id'
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri:  'storageUri'
      }
    }
  }
}
