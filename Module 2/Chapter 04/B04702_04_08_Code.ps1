$Odata = @{
            Uri = 'http://services.odata.org/v3/(S(snyobsk1hhutkb2yulwldgf1))/odata/odata.svc'
            MetadataUri = 'http://services.odata.org/v3/(S(snyobsk1hhutkb2yulwldgf1))/odata/odata.svc/$metadata'
            OutputModule = 'C:\Temp\DemoModule'
            AllowUnSecureConnection = $true
          }
Export-odataEndpointProxy @Odata