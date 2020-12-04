
$puzzleinput = Get-Content ./Day4/puzzleinput4.txt
class passport {
    [String]$byr1
    [String]$iyr1
    [String]$eyr1
    [String]$hgt1
    [String]$hcl1
    [String]$ecl1
    [String]$pid1
    [String]$cid1
}
$passport = New-Object passport

$passports = New-Object Collections.Generic.List[System.Object]
foreach ($line in $puzzleinput) {
    if ($line -ne "") {
        $line -split " " | ForEach-Object {
            $passport."$(($_ -split ":")[0])1" = ($_ -split ":")[1]
        }
    }
    else {
        $passports.Add($passport)
        $passport = New-Object passport
    }
}
$passports.Add($passport)
$valid = 0
foreach ($passport in $passports) {
    if (!(
            $null -eq $passport.byr1 -or
            $null -eq $passport.iyr1 -or
            $null -eq $passport.eyr1 -or
            $null -eq $passport.hgt1 -or
            $null -eq $passport.hcl1 -or
            $null -eq $passport.ecl1 -or
            $null -eq $passport.pid1
        )) {
        $valid++
    }
}
$valid
$eyes = @("amb", "blu", "brn", "gry", "grn", "hzl", "oth")
$valid2 = 0
foreach ($passport in $passports) {
    if (
        ($passport.byr1 -ge 1920) -and ($passport.byr1 -le 2002) -and

        ($passport.iyr1 -ge 2010) -and ($passport.iyr1 -le 2020) -and
        
        ($passport.eyr1 -ge 2020) -and ($passport.eyr1 -le 2030) -and

        (
            (
                ($passport.hgt1 -like "*cm") -and 
                ([int]($passport.hgt1 -replace "cm") -ge 150) -and 
                ([int]($passport.hgt1 -replace "cm") -le 193)
            ) -or
            (
                ($passport.hgt1 -like "*in") -and 
                ([int]($passport.hgt1 -replace "in") -ge 59) -and 
                ([int]($passport.hgt1 -replace "in") -le 76)
            ) 
        ) -and

        ($passport.hcl1 -match '^#[a-f0-9]{6}$') -and


        ($eyes -contains $passport.ecl1) -and
        ($passport.pid1 -match '^[0-9]{9}$')
    ) {
        $valid2++
    }
}
$valid2
