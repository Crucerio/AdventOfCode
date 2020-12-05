$puzzleinput = Get-Content ./Day5/puzzleinput5.txt
$ids=foreach($seat in $puzzleinput){
    $row=[convert]::ToInt32(($seat[0..6] -replace "F",0 -replace "B",1 -join ""),2)
    $column=[convert]::ToInt32(($seat[7..9] -replace "L",0 -replace "R",1 -join ""),2)
    $maxid=[math]::Max($maxid,$row*8+$column)
    $row*8+$column
}
write-output $maxid

$ids=$ids |Sort-Object
for ($i=0;$i -lt ($ids.count -1);$i++){
    if (!($ids[$i]+1 -eq $ids[$i+1])){
        return $ids[$i]+1
    }
}