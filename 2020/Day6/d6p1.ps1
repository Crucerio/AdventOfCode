$puzzleinput = Get-Content ./2020/Day6/puzzleinput6.txt
$counter=0
$buchstaben = New-Object 'system.collections.generic.dictionary[[string],[system.collections.generic.list[string]]]'
foreach ($item in $puzzleinput){
    if($item -eq ""){
        $counter=$counter+$buchstaben.Count
        $buchstaben = New-Object 'system.collections.generic.dictionary[[string],[system.collections.generic.list[string]]]'
    }else{
        $item[0..26]|ForEach-Object{
            $buchstaben[$_]="True"
        }
    }
}
$counter=$counter+$buchstaben.Count
Write-Output "part1"
$counter

$puzzleinput = Get-Content ./2020/Day6/puzzleinput6.txt
$counter=0
$i=0
$buchstaben = New-Object 'system.collections.generic.dictionary[[string],[int]]'
foreach ($item in $puzzleinput){
    if($item -eq ""){
        foreach ($answer in $buchstaben.Values){
            if ($answer -eq $i){
                $counter++
            }
        }
        $i=0
        $buchstaben = New-Object 'system.collections.generic.dictionary[[string],[int]]'
    }else{
        $item[0..26]|ForEach-Object{
            $buchstaben[$_]=$buchstaben[$_]+1
        }
        $i++
    }
}
foreach ($answer in $buchstaben.Values){
    if ($answer -eq $i){
        $counter++
    }
}
Write-Output "part2"
$counter