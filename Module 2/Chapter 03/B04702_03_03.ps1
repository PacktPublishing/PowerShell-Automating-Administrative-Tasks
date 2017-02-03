# From release notes

enum Ensure
{
    Absent
    Present
}

[DscResource()]
class StringLiteral
{
    [DscProperty(Key)]
    [string]$Path
    
    [DscProperty(Mandatory)]
    [Ensure] $Ensure    
    
    [DscProperty(Mandatory)]
    [string] $SourcePath

    [DscProperty(NotConfigurable)]   
    [Nullable[datetime]] $CreationTime 

    [void] Set()
    {             
    }

    [bool] Test()
    {
    }
    
    [StringLiteral] Get()
    {
    }
}