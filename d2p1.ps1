$i=0
(Get-Content ./Day2/puzzleinput2.txt) |ForEach-Object{
    $obj=($_ -replace ":" -split {$_ -eq "-" -or $_ -eq " "})
    $a=(Select-String -InputObject $obj[3] -Pattern $obj[2] -AllMatches).Matches.Count
    if ($a -ge $obj[0] -and $a -le $obj[1]){
        $i++
    }
}
$i
