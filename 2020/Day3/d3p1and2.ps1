function slope ($dx, $dy) {
    $y = 0
    $counter = 0
    foreach ($line in (Get-Content ./Day3/puzzleinput3.txt)) {
        if (($y)%$dy -ne 0){$y++;continue}
        $x = ($y/$dy * $dx) % $line.length
        if ($line[$x] -eq "#") {
            $counter++
        }
        $y++
    }
    $counter
}
Write-Output "Answer1
$(slope -dx 3 -dy 1)"
Write-Output "Answer2
$((slope -dx 1 -dy 1)*
(slope -dx 3 -dy 1)*
(slope -dx 5 -dy 1)*
(slope -dx 7 -dy 1)*
(slope -dx 1 -dy 2)
)"