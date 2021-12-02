Import-Module ./Write-Answer.psm1 -force
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
$answer=$x*$y
Write-Answer -Expected 2272262 -Answer $answer -part 1

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
$answer=$x*$y
Write-Answer -Expected 2134882034 -Answer $answer -part 2