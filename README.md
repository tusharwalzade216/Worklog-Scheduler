==================================== Use ======================================

- This Powershell based Utility is useful to send a Worklog email to specified addresses on daily/ frequent basis

==================================== Files ======================================
1. log_mail.ps1 -> code to send worklog email
2. log.txt -> worklog in given format as of now
3. sendmail.bat -> command to execute log_mail.ps1 via PowerShell
4. schedule_mail.bat -> command to schedule task for given period
5. deleteWorklogScheduler.bat   -> Utility to delete this scheduled task

==================================== Pre-requisits =================================
- Windows
- PowerShell

==================================== Run ======================================
- Download this project & Update the necessary paths, SMTP credentials/ details in files
- Run this file - `schedule_mail.bat` as an Administrator.
    - It will schedule the task using windows task scheduler, so that it would run periodically.

==================================== Delete =====================================
- If you want to delete this scheduled task from scheduler, just run the file - `deleteWorklogScheduler.bat` as an Administrator.
