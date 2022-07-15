import radius as radius

param environmentId string

param location string = resourceGroup().location

resource app 'Applications.Core/applications@2022-03-15-privatepreview' = {
  name: 'todoapp'
  location: location
  properties: {
    environment: environmentId
  }
}