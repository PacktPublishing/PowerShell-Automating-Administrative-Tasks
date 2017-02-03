$FileName = $Env:USERNAME 
$savepath="C:\$FileName.docx" 
 
 
$word = New-object -ComObject "Word.Application" 
$doc=$word.documents.Add() 
$Resume=$word.Selection 
 
 
$Resume.Style="Title" 
$UserName = Get-ADUser -Identity $ENV:USERNAME -Properties * 
$Picture = Get-ADUser -Identity $ENV:USERNAME -Properties thumbnailphoto 
 
$Picture.thumbnailphoto | Set-Content "C:\Photo.jpg" -Encoding Byte 
$Resume.TypeText("$($UserName.Name)") 
$Resume.InlineShapes.AddPicture("C:\Photo.jpg") 
 
$Resume.TypeParagraph() 
$Resume.Style="Normal" 
$Resume.TypeText("Department: $($UserName.Department), Office Phone: $($UserName.OfficePhone), Email: $($UserName.mail)") 
 
 
$Resume.TypeParagraph() 
$Resume.Style="SubTitle" 
$Resume.TypeText(("Objective")) 
 
$Resume.TypeParagraph() 
$Resume.Style="SubTitle" 
$Resume.TypeText(("Skills")) 
 
$Resume.TypeParagraph() 
$Resume.Style="SubTitle" 
$Resume.TypeText(("Education")) 
 
$Resume.TypeParagraph() 
$Resume.Style="SubTitle" 
$Resume.TypeText(("Projects")) 
 
$Resume.TypeParagraph() 
$Resume.TypeParagraph() 
$Resume.TypeParagraph() 
$Resume.Style="SubTitle" 
$Resume.TypeText(("I hereby declare that the above written particulars are true to the best of my knowledge and belief.")) 
$Resume.TypeParagraph() 
$Resume.TypeParagraph() 
$Resume.TypeParagraph() 
$Resume.Style="Strong" 
$Resume.TypeText("Name    :    $($UserName.Name)") 
$Resume.TypeParagraph() 
$Date = Get-Date  
$Resume.TypeText("Date    :    $($Date)") 
 
$doc.SaveAs([ref]$savepath)     
$doc.Close() 
     
$word.quit() 
Invoke-Item $savepath