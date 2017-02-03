$url = "http://blogs.technet.com/b/wikininjas/rss.aspx"
[xml]$xml = (New-object System.Net.WebClient).DownloadString($url)
$xml.rss.channel | %{$_.item} | ? {[DateTime]$_.pubDate -gt  (Get-Date).AddMonths(-3)} | FT creator