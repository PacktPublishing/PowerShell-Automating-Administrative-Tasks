$var = New-WebServiceProxy -Uri http://www.webservicex.net/CurrencyConvertor.asmx?WSDL
$var.ConversionRate('Eur','US')
