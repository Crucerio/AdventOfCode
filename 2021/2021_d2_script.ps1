
$puzzle = Get-Content "./2021/2021_d2_input1.txt"
$x=0
$y=0
foreach ($p in $puzzle) {
    switch (($p -split " ")[0]) {
        forward { $x+=(($p -split " ")[1]) }
        down { $y+=(($p -split " ")[1]) }
        up { $y-=($p -split " ")[1] }
    }
}
"Answerpuzzle 1"
$x*$y

$aim=0
$x=0
$y=0
foreach ($p in $puzzle) {
    switch (($p -split " ")[0]) {
        forward { 
            $x+=(($p -split " ")[1])
            $y+=$aim*(($p -split " ")[1])
        }
        down { $aim+=(($p -split " ")[1]) }
        up { $aim-=($p -split " ")[1] }
    }
}
"Answerpuzzle 2"
$x*$y