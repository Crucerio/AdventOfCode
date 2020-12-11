function Get-LastAccumulator {
    param(
        [array]$puzzleinput,
        [System.Int32]$x,
        [System.Int32]$acc
    )
    $list = New-Object -TypeName System.Collections.ArrayList
    while (($list -notcontains $x) -and ($null -ne $puzzleinput[$x])) {
        [void]$list.Add($x)
        $split = $puzzleinput[$x] -split " "
        switch ($split[0]) {
            acc {
                $acc = $acc + $split[1]
                $x++
            }
            jmp {
                $x = $x + $split[1]
            }
            nop {
                $x++
            }
        }
    }
    return "1" | Select-Object @{
        label = "acc"; Expression = { $acc }
    },
    @{
        label = "List"; Expression = { $List }
    },
    @{
        label = "instruction"; Expression = { $puzzleinput[$x]}
    }
}
[array]$puzzleinput = Get-Content ./2020/Day8/puzzleinput8.txt
$x = 0
$acc = 0
$answer1=Get-LastAccumulator -puzzleinput $puzzleinput -x 0 -acc 0
"Part1: $($answer1.acc)"
foreach($op in $answer1.List){
    switch (($puzzleinput[$op] -split " ")[0]) {
        jmp {
            $puzzleinput[$op]=$puzzleinput[$op] -replace "jmp","nop"
         }
        nop {
            $puzzleinput[$op]=$puzzleinput[$op] -replace "nop","jmp"
        }
        default{}
    }
    $answer2 = Get-LastAccumulator -puzzleinput $puzzleinput -x 0 -acc 0
    [array]$puzzleinput = Get-Content ./2020/Day8/puzzleinput8.txt
    if($null -eq $answer2.instruction){
        return $answer2
    }
}
