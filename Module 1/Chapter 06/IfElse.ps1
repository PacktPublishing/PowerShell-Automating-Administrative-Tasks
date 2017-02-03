Param($number)
if($number -eq 5){
    write-Output 'You guessed the magic number'
} else 
{
  write-output 'You did not guess it, you lose'
}