$masterlist = Import-csv .\MasterlAceDistributionLists.txt

foreach ($list in $masterlist ){
	$group = $group = Get-QADGroup -Identity $list.name -IncludeAllProperties
	$user = $group.ManagedBy

	write-host "Group: " $group
	write-host "User: " $user

	$group | Set-QADGroup -ManagedBy $user 
	$group | Add-QADPermission -Property Member -Account $user -ApplyTo ThisObjectOnly -Rights WriteProperty

	

}