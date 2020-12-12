[array]$puzzleinput = Get-Content ./2020/Day9/puzzleinput9.txt|ForEach-Object{[Int64]::parse($_)}
$preamble = 25
$i = 0
for ($i = $preamble; $i -lt $puzzleinput.Count; $i++) {
    $att=$false
    $pfui = $puzzleinput[($i - $preamble)..($i - 1)]
    for ($j = 0; $j -lt $preamble; $j++) {
        for ($k = 0; $k -lt $preamble; $k++) {
            if (($pfui[$j] + $pfui[$k] -eq $puzzleinput[$i]) -and ($pfui[$j] -ne $pfui[$k])) {
                $att = $true
                continue
            }
        }
    }
    if (!$att){$answer1=$puzzleinput[$i] }
}
$answer1
$l=0
$h=1
while($answer2sum -ne $answer1){
    $sum=$puzzleinput[$l..$h]|
    Measure-Object -Sum |
    Select-Object -ExpandProperty sum
    switch ($sum) {
        {$_ -eq $answer1} { 
            $return=$puzzleinput[$l..$h]|
            Measure-Object -min -max|ForEach-Object{$_.minimum+$_.maximum}
            return $return
        }
        {$_ -lt $answer1} { $h++ }
        {$_ -gt $answer1} { $l++ }
    }
}