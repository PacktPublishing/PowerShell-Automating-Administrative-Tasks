$request = Invoke-WebRequest 'https://www.facebook.com/login.php' -SessionVariable lgn
$Forms = $request.Forms[0]

#To Check the Internal Field Names
$Forms.Fields

$Forms.Fields['email'] = 'UserID'
$Forms.Fields['Password'] = 'Password'

$login =Invoke-WebRequest -Uri ("https://www.facebook.com" + $form.Action) -WebSession $lgn -Method POST -Body $Forms.Fields

#To Check the Post Action result
$login

$login =Invoke-WebRequest -Uri ("https://www.facebook.com" + $form.Action) -WebSession $lgn -Method POST -Body $Forms.Fields
$fb = $login.Forms[0]

#Output
$fb 