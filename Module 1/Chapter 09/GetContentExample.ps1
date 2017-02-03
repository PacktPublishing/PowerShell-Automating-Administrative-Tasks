$servers=get-content servers.txt
foreach($server in $servers){
    get-service -Name MSSQLSERVER -ComputerName $server
}
