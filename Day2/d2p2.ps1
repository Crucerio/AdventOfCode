$i=0
(Get-Content ./Day2/puzzleinput2.txt)|ForEach-Object{
    $obj=($_ -replace ":" -split {$_ -eq "-" -or $_ -eq " "})
    $j=0
    if($obj[3][$obj[0]-1] -eq $obj[2]){
        $j++
    }
    if($obj[3][$obj[1]-1] -eq $obj[2]){
        $j++
    }
    if ($j -eq 1){
        $i++
        Write-Output valid
    }else{
        Write-Output invalid
    }
}
$i