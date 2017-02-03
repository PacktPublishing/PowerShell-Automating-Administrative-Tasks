#Json Format in C:\Temp\JSON.json
{
"1": "One",
"2": "Two",
"3": "Three"
} 

#Reading the JSON content
$data = Get-Content C:\Temp\JSON.json -Raw | ConvertFrom-Json
$data.psobject.Properties.Name
