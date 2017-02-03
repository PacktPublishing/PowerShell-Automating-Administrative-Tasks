$Json = Invoke-WebRequest -Uri "http://itunes.apple.com/search?term=metallica" 
($Json | ConvertFrom-Json).Results | Select WrapperType, trackName | Select -First 25