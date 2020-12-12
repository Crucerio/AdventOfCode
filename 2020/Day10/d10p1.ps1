[System.Collections.ArrayList]$puzzleinput = Get-Content ./2020/Day10/puzzleinput10.txt|ForEach-Object{[Int64]::parse($_)}
$sortedpuzzle=$puzzleinput| Sort-Object
$sortedpuzzle+=0
$dist1=0
$dist3=1
for($i=0;$i -lt $sortedpuzzle.Count;$i++){
    $dist=$sortedpuzzle[$i]-$sortedpuzzle[$i-1]
    switch ($dist) {
        1 { $dist1++ }
        3 { $dist3++ }
        Default {}
    }
}
$answer1=$dist1*$dist3
$answer1

