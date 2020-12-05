#AOC2020d1p2
$numbers=Get-Content ./Day1/puzzleinput1.txt|%{[System.int32]::Parse($_)}|Sort-Object
for ($i=0;$i -lt $numbers.Count;$i++){
    for ($j=0;$j -lt $numbers.Count;$j++){
        for ($k=0;$k -lt $numbers.Count;$k++){
            if ($numbers[$i]+$numbers[$j]+$numbers[$k] -eq 2020){
                return $numbers[$i]*$numbers[$j]*$numbers[$k]
            }
        }
    }
}