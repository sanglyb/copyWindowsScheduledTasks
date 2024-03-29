$NewTaskCreds = Get-Credential
$comps=get-adcomputer -filter {cn -like "mx0*" -and enabled -eq "True"}
#$comps=@("comp1","comp2","comp3")
foreach ($comp in $comps){
	Get-ScheduledTask -CimSession $comp.name | Where-Object { $_.Principal.UserId -eq $NewTaskCreds.UserName } | Set-ScheduledTask -User $NewTaskCreds.UserName -Password $NewTaskCreds.GetNetworkCredential().Password
	#Get-ScheduledTask -CimSession $comp.name | Where-Object { $_.Principal.UserId -eq $user }
}