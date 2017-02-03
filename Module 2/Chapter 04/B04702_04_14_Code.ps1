$Images = 'Url1/image1.jpg , url1/image2.jpg'
$Dir = 'C:\Temp\'
$wc = New-Object System.Net.WebClient
foreach ($sourceFile in $Images){
  $sourceFileName = 
    $sourceFile.SubString($sourceFile.LastIndexOf('/')+1)
  $targetFileName = $targetDirectory + $sourceFileName
  $wc.DownloadFile($sourceFile, 'C:\Temp')
}
