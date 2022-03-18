resource app 'radius.dev/Application@v1alpha3' = {
  name: 'myapp'
  
  resource twilio 'Extender@v1alpha3' = {
    name: 'twilio'
    properties: {
      fromNumber: '222-222-2222'
      secrets: {
        accountSid: 'sid'
        authToken: 'token'
      }
    }
  }

  resource publisher 'Container@v1alpha3' = {
    name: 'publisher'
    properties: {
      container: {
        image: 'radius.azurecr.io/magpie:latest'
        env: {
          TWILIO_NUMBER: twilio.properties.fromNumber
          TWILIO_SID: twilio.secrets('accountSid')
          TWILIO_ACCOUNT: twilio.secrets('authToken')
        }
      }
    }
  }
  
}