function Get-WebAppPool{
param([string]$name)
    if($name){
        dir IIS:\AppPools | where Name -like $name
    } else {
        dir IIS:\AppPools
    }
}