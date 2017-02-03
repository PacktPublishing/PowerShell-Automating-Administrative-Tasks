function test-switch{
param([switch]$MySwitch)
    if ($MySwitch){
        write-host 'You used the switch'
    } else {
        write-host 'You didn''t use the switch'
    }
 }