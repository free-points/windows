$users = Get-Content "E:\UserScripts\UsersP.txt"
foreach ($user in $users) {
    
    $UserAccount = Get-LocalUser -Name "$user"
    $UserAccount | Set-LocalUser -Password (ConvertTo-SecureString -AsPlaintext "@aBc123!" -Force)
        
}