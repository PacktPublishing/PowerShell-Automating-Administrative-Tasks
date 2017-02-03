<#
.Synopsis
   Creates a folder and sets the location to it
.DESCRIPTION
   This function takes the path of a folder to create as a parameter,
   creates it and then sets the location to the new folder.
.EXAMPLE
   Set-NewFolderLocation c:\temp\test1
.EXAMPLE
   Set-NewFolderLocation E:\example2
.INPUTS
   Does not accept pipeline input
.OUTPUTS
   Outputs the folder that was created
#>
function Set-NewFolderLocation{
    Param($path)
    new-item -ItemType Directory -path $path
    cd $path
}
