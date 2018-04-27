# username for SMTP
$Username = "xxxxxxx@gmail.com";
# password for SMTP
$Password = "12345678";
# function to send email on both success and error conditions
function Send-ToEmail() {

    $message = new-object Net.Mail.MailMessage;
    $message.From = $Username;
    $message.To.Add("abcd@gmail.com");
    $message.CC.Add("xyz@gmail.com");
    $message.IsBodyHtml = $TRUE;

    $message.Subject = $("WorkLog: Tushar - " + $currentDate);
    $message.Body = "Hello Sir,<br>&emsp;&emsp;&emsp;My Today's worklog is - <br><br><pre>$($contentToSend)</pre><br>Regards,<br>Tushar Walzade";

    $smtp = new-object Net.Mail.SmtpClient("smtp.mailgun.org", "25");
    $smtp.EnableSSL = $true;
    $smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
    $smtp.send($message);
    write-host "Mail Sent" ; 
}

$filePath = "C:\Users\tusharw\Desktop\log.txt";

if($filePath | Test-Path) {
    $fileContent = Get-Content -Path $filePath;
    if($fileContent.Length -eq 0) {
        exit;
    }
    $fileLogDate = $fileContent[0];
    $currentDate = Get-Date -Format "dd/MM/yyyy";
    $fileContent = $fileContent[1..($fileContent.length - 1)];
    $contentToSend = $($fileContent -join "`n");
    # Day Name
    $day = (Get-Date).DayOfWeek;
    if (($currentDate -eq $fileLogDate) -and ($contentToSend.Length -gt 5) -and ($day -ne "Saturday") -and ($day -ne "Sunday")) {
        Send-ToEmail
    }
}