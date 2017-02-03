$weather = New-WebServiceProxy -uri http://www.webservicex.com/globalweather.asmx?WSDL
([XML]$weather.GetWeather('Amsterdam','Netherlands')).CurrentWeather