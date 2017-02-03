$json = @"
{
    "User1": {"Name": "Chen", "Role": "SharePoint IT Pro"}, 
    "User2": {"Name":"Keanu"}
}
"@
$data = $json | ConvertFrom-Json
$data.User1
$data.User2
