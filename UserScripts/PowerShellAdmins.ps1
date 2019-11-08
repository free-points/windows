$AUs = Get-Content "E:\UserScripts\UsersAU.txt"
$Nonadmins = Get-Content "E:\UserScripts\UsersNA.txt"
foreach ($Nonadmin in $Nonadmins) {

        Remove-LocalGroupMember -Group "Administrators" -member $Nonadmin
    }

foreach ($AU in $AUs) {
    
    Remove-LocalGroupMember -Group "Power Users" -member $AU
    Remove-LocalGroupMember -Group "Backup Operators" -member $AU
    }