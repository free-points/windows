


$Nonadmins = Get-Content "E:\UserScripts\UsersNA.txt"
$AdminsCs = Get-LocalGroupMember -Group "Administrators"
$CName = $env:COMPUTERNAME
foreach ($Nonadmin in $Nonadmins) {

        Remove-LocalGroupMember -Group "Administrators" -member $Nonadmin
    }