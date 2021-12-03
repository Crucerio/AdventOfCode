Import-Module ./Write-Answer.psm1 -force
$puzzle = Get-Content "./2021/2021_d3_input0.txt"
$puzzle = Get-Content "./2021/2021_d3_input1.txt"

$sums = @{}
for ($i = 0; $i -lt $puzzle.Count; $i++) {
    for ($j = 0; $j -lt $puzzle[$i].Length; $j++) {
        $sums[$j] += [System.Decimal]::Parse($puzzle[$i][$j])
    }
}

$gamma = [convert]::ToInt32([System.Decimal]::Parse("$(for ($k=0;$k -lt $sums.count; $k++){
    [math]::Round($sums[$k]/$puzzle.count)
})" -replace " "), 2)
$epsilon = [convert]::ToInt32([System.Decimal]::Parse("$(for ($k=0;$k -lt $sums.count; $k++){
    1-[math]::Round($sums[$k]/$puzzle.count)
})" -replace " "), 2)

$answer = $gamma * $epsilon
Write-Answer -Expected 4191876 -Answer $answer -part 1
function puzzle {
    [CmdletBinding()]
    param (
        [Parameter()]
        $puzzle,
        [Parameter()]
        $stelle
    )
    $outpuzzle=if (($puzzle | ForEach-Object { [System.Decimal]::Parse($_[$stelle]) } | Measure-Object -sum).sum -ge (($puzzle.count) / 2)) {
        $puzzle | Where-Object {
            $_[$stelle] -eq "1"
        }
    }
    else {
        $puzzle | Where-Object {
            $_[$stelle] -eq "0"
        }
    }
    if ($outpuzzle.count -gt 1){
        $stelle++
        puzzle -puzzle $outpuzzle -stelle $stelle
    }else{
        $outpuzzle
    }
}
function puzzleB {
    [CmdletBinding()]
    param (
        [Parameter()]
        $puzzle,
        [Parameter()]
        $stelle
    )
    $outpuzzle=if (($puzzle | ForEach-Object { [System.Decimal]::Parse($_[$stelle]) } | Measure-Object -sum).sum -lt (($puzzle.count) / 2)) {
        $puzzle | Where-Object {
            $_[$stelle] -eq "1"
        }
    }
    else {
        $puzzle | Where-Object {
            $_[$stelle] -eq "0"
        }
    }
    if ($outpuzzle.count -gt 1){
        $stelle++
        puzzleB -puzzle $outpuzzle -stelle $stelle
    }else{
        $outpuzzle
    }
}

$o2=[convert]::ToInt32([System.Decimal]::Parse("$(puzzle -puzzle $puzzle -stelle 0)"),2)
$co2=[convert]::ToInt32([System.Decimal]::Parse("$(puzzleB -puzzle $puzzle -stelle 0)"),2)

$Answer2=$o2*$co2
Write-Answer -Expected 3414905 -Answer $answer2 -part 2