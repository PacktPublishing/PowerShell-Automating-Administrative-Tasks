ForEach($file in (dir c:\temp -file)){
    write-output $file.Extension
}