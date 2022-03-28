# Run this scipt on an rds server
# Use your own system to get a msg

# Adjust from full '0' to empty '100' when the warning should be genererated
$isWarning = 30

# We will get the size in % by doing (SizeRemaining\Totalsize * 100)
$UserDisk = Get-Volume | Where-Object {($_.FileSystemLabel -eq "User Disk") -and ((($_.SizeRemaining / $_.Size) * 100) -lt $isWarning)}

# We will need this part for the username
$UserPart = Get-Partition | Where-Object {$_.AccessPaths -like "*C:\users\*"}

# Because more then 1 upd can be full we will use a foreach
foreach ($Disk in $UserDisk){

    $Fulldisk = $UserPart | Where-Object  -Property AccessPaths -like $disk.objectid -ErrorAction Ignore
    $UserFormat = $FullDisk.AccessPaths -split ',' | Select-Object -First 1
    $Username = ($UserFormat.split("\"))[2]

    # MSGing system
    # Send-mail or something
}

# End of Script