$weekDay=Get-Date | select-Object -ExpandProperty DayOfWeek
if($weekDay -eq 'Saturday'){
    write-host '2 days of weekend left'
} elseif ($weekday -eq 'Sunday'){
    write-host '1 day of weekend left'
} else {
    write-host 'Have to go to work today!'
}