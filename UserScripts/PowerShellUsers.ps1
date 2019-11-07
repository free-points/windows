$users = Get-Content "E:\UserScripts\UsersU.txt"
$allusers = Get-Content "E:\UserScripts\UsersAU.txt"
foreach ($alluser in $allusers) {
    $good=0
    foreach($user in $users) {
        if($user -eq $alluser) {
            $good=1
        }
    }
    if(!$good) {
        Write-Output $alluser
    }
}