$Json = Invoke-RestMethod -Uri "http://itunes.apple.com/search?term=metallica"
$Json.results | Select WrapperType , trackName | Select -First 25