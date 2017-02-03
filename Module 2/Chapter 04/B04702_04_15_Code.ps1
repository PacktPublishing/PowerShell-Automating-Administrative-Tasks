$url = "http://blogs.technet.com/b/wikininjas/rss.aspx"
[xml]$xml = (New-object System.Net.WebClient).DownloadString($url)
$xml.rss.channel.description