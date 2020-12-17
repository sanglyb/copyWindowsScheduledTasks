# copyWindowsScheduledTasks
PowerShell script to copy Windows Scheduled tasks to another computers over the network.
In this script I for example copying all tasks from folder \audit\ to all domain controllers in organization. If you want to copy all tasks from root folder path should be "\".
Please, check line 
```powershell
Get-ScheduledTask -TaskPath $taskpath -CimSession $comp.name | Unregister-ScheduledTask -Confirm:$false
```
It will remove all tasks in seted folder on destination computers. If you do not need it - delete or comment that line. 

[My blog](https://www.mytechnote.ru/)
