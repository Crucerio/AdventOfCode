#AOC Lesson 1
$numbers=Get-Content ./Day1/puzzleinput1.txt|%{[System.int32]::Parse($_)}|Sort-Object
$i=0
$j=$numbers.Count-1
while ($true){
    if(($numbers[$i]+$numbers[$j]) -eq 2020){
        return $($numbers[$i]*$numbers[$j])
    }elseif ($numbers[$i]+$numbers[$j] -gt 2020) {
        $j--
    }elseif ($numbers[$i]+$numbers[$j] -lt 2020) {
        $i++
    }
}