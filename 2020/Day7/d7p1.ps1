$puzzleinput = Get-Content ./2020/Day7/puzzleinput7.txt
function Get-BagRule ($rule) {
    $topbag = ($rule -split " contain ")[0] -replace 's$'
    $bagcontent = (
        $rule -split " contain "
    )[1] -split ", " -replace '\.' -replace 's$' | ForEach-Object {
        if ($_ -ne "no other bag") {
            $bagname = ($_ -split ' ', 2)[1]
            $amount = ($_ -split ' ', 2)[0]
            "1" | Select-Object @{
                label = "BagName"; Expression = { $bagname }
            },
            @{
                label = "amount"; Expression = { $amount }
            }
        }
    }
    return "1" | Select-Object @{
        label = "TopBag"; Expression = { $topbag }
    },
    @{
        label = "BagContent"; Expression = { $bagcontent }
    }
}
$bagrules = New-Object 'system.collections.generic.dictionary[[string],[system.collections.generic.list[array]]]'
$puzzleinput | ForEach-Object {
    $key=Get-BagRule $_
    $bagrules[$key.TopBag]=@($key.BagContent)
}

function Find-ValidTopBag ($bagrules,$contentbag) {
    foreach ($topbag in $bagrules.Keys){
        if($bagrules[$topbag].BagName -contains $contentbag){
            $topbag
            Find-ValidTopBag -bagrules $bagrules -contentbag $topbag
        }
    }
}
$set=Find-ValidTopBag -bagrules $bagrules -contentbag "shiny gold bag"|
Select-Object -Unique
$set.count
