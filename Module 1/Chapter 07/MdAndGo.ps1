function MdAndGo{
    Param($path)
    new-item -ItemType Directory -path $path
    cd $path
}
