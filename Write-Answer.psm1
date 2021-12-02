function Write-Answer {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $Expected,
        [Parameter(Mandatory=$true)]
        $Answer,
        [Parameter(Mandatory=$true)]
        $Part
    )
    if(
        $Expected -eq $Answer
    ){
        Write-Output "Answer Part $Part`: $([char]0x001B)[32m$Answer$([char]0x001B)[0m"
    }else {
        Write-Output "Answer Part $Part`: $([char]0x001B)[31m$Answer$([char]0x001B)[0m"
        Write-Output "Expected: $Expected"
    }
}