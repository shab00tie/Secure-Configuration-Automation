#Check for accounts whose passwords are set not to expire
Get-ADUser -Filter 'useraccountcontrol -band 65536' -Properties useraccountcontrol | export-csv U-DONT_EXPIRE_PASSWORD.csv

#Check for accounts with no password requirement
Get-ADUser -Filter 'useraccountcontrol -band 32' -Properties useraccountcontrol | export-csv U-PASSWD_NOTREQD.csv

#Check for accounts with passwords stored using reversible encryption
Get-ADUser -Filter 'useraccountcontrol -band 128' -Properties useraccountcontrol | export-csv U-ENCRYPTED_TEXT_PWD_ALLOWED.csv

#Check for accounts that are trusted for kerberos delegation
Get-ADUser -Filter 'useraccountcontrol -band 524288' -Properties useraccountcontrol | export-csv U-TRUSTED_FOR_DELEGATION.csv

#Check for accounts that don't require preauthentication
Get-ADUser -Filter 'useraccountcontrol -band 4194304' -Properties useraccountcontrol | export-csv U-DONT_REQUIRE_PREAUTH.csv

#Check for accounts what have credentials encrypted with DES
Get-ADUser -Filter 'useraccountcontrol -band 2097152' -Properties useraccountcontrol | export-csv U-USE_DES_KEY_ONLY.csv
