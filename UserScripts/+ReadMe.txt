UsersAU:
--------
This text file contains a list of all present users, as determined by a 'wmic' command in ../launch.bat.
This needs to be human-checked for any possible errors.
It is used by PowerShellAdmins and PowerShellUsers.

UsersNA:
--------
This text file is to include "Limited" or non-administrative users. 
You must fill this manually.
It is parsed by PowerShellAdmins to autmatically remove unauthorized Administrators.

UsersP: 
--------
This text file is to contain a list of all users on the system excluding the primary user.
You must fill this file manually.
It is used by PowerShellUsers to automatically reset passwords on the listed user accounts.
DO NOT CHANGE THE PASSWORD OF THE PRIMARY USER. It may (read: will) lock you out.

UsersU:
--------
This text file must contain all authorized users on the system, including administrators. 
You must fill this file manually.
It is read by PowerShellUsers to automatically purge any unauthorized users from the system.
Please remember to do forensic questions first.
