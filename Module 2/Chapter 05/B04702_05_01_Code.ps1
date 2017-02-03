Function Set-Window {
  Param(
    [Parameter(Mandatory = $true)]
    $ID
  )
$code = @"
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int 
  nCmdShow);
"@
$demo = Add-Type -MemberDefinition $code -Name "Demo" -Namespace Win32Functions -PassThru
$demo::ShowWindowAsync((Get-Process -id $ID).MainWindowHandle , 2)
}
Set-Window -ID $pid