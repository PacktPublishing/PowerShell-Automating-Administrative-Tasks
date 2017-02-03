function test-paths{
Param([string]$path1,[string]$path2)

    return (test-path $path1) -and (test-path $path2)
}