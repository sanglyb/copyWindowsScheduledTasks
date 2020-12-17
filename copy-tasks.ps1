$taskpath="\audit\"
$user="domain\scriptRunner"
$password="verysecret"
$tasks=get-ScheduledTask -taskpath $taskpath 
$comps=Get-ADDomainController -filter * | Select-Object name
foreach ($comp in $comps){
	if ($comp.name -ne $env:computername){
		$comp.name
		Get-ScheduledTask -TaskPath $taskpath -CimSession $comp.name | Unregister-ScheduledTask -Confirm:$false
		foreach ($task in $tasks){
			$task.taskname
			$exported=export-scheduledtask -taskpath $taskpath -TaskName $task.taskname
			Register-ScheduledTask -Xml $exported -cimsession $comp.name -taskname $task.taskname -User $user -password $password -TaskPath $taskpath -force
		}
	}
}
