
$puzzle=Get-Content ./2021_d1_input1.txt|ForEach-Object{[System.Decimal]::Parse($_)}
$j=0
for ($i=1;$i -lt $puzzle.count;$i++ ){
    if($puzzle[$i-1] -lt $puzzle[$i]){
        $j++
    }
}
"Part 1"
$j
$j=0
for ($i=3;$i -lt $puzzle.count;$i++ ){
    if(
        $puzzle[$i-3] + $puzzle[$i-2] + $puzzle[$i-1] -lt
        $puzzle[$i-2] + $puzzle[$i-1] + $puzzle[$i]
        ){
        $j++
    }
}
$j