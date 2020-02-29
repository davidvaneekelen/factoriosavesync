# save folder variables
$factorioSaveFolder = "$env:APPDATA\Factorio\saves"
$onedriveSaveFolder = "$env:USERPROFILE\OneDrive\Delen met Yuma"

# save game files
$factorioSaveGames = Get-ChildItem $factorioSaveFolder
$onedriveSaveGames = Get-ChildItem $onedriveSaveFolder

$mostRecentFactorioSave = $null
$mostRecentOnedriveSave = $null

#check most recent save game in Factorio Save folder
for ($i=0; $i -lt $factorioSaveGames.Count; $i++) {
    if ($mostRecentFactorioSave -eq $null) {
        $mostRecentFactorioSave = $factorioSaveGames[$i].CreationTime
    }
    
    if ($factorioSaveGames[$i].CreationTime -gt $mostRecentFactorioSave.CreationTime) {
        $mostRecentFactorioSave = $factorioSaveGames[$i].CreationTime
    }
    
}

#check most recent save game in Onedrive Save folder
for ($i=0; $i -lt $onedriveSaveGames.Count; $i++) {
    if ($mostRecentOnedriveSave -eq $null) {
        $mostRecentOnedriveSave = $onedriveSaveGames[$i].CreationTime
    }
    
    if ($onedriveSaveGames[$i].CreationTime -gt $mostRecentOnedriveSave.CreationTime) {
        $mostRecentOnedriveSave = $onedriveSaveGames[$i].CreationTime
    }
    
}

Write-Host "Most Recent Factorio Save:"
Write-Host "----------------------------"
Write-Host $mostRecentFactorioSave
Write-Host $mostRecentFactorioSave.CreationTime
Write-Host "----------------------------"

Write-Host "Most Recent OneDrive Save:"
Write-Host $mostRecentOnedriveSave
Write-Host $mostRecentOnedriveSave.CreationTime
Write-Host "----------------------------"