Import-Module ./Write-Answer.psm1 -force
#$puzzle = Get-Content "./2021/2021_d3_input0.txt"
$puzzle = Get-Content "./2021/2021_d3_input1.txt"

$sums=@{}
for ($i=0;$i -lt $puzzle.Count;$i++){
    for ($j=0;$j -lt $puzzle[$i].Length;$j++){
        $sums[$j]+=[System.Decimal]::Parse($puzzle[$i][$j])
    }
}

$gamma=[convert]::ToInt32([System.Decimal]::Parse("$(for ($k=0;$k -lt $sums.count; $k++){
    [math]::Round($sums[$k]/$puzzle.count)
})" -replace " "),2)
$epsilon=[convert]::ToInt32([System.Decimal]::Parse("$(for ($k=0;$k -lt $sums.count; $k++){
    1-[math]::Round($sums[$k]/$puzzle.count)
})" -replace " "),2)

$answer = $gamma*$epsilon
Write-Answer -Expected 4191876 -Answer $answer -part 1