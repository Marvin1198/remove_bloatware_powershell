# Define the list of bloatware apps to remove
$bloatwareApps = @(
    "Microsoft.XboxApp",
    "Microsoft.Messaging",
    "Microsoft.Office.OneNote",
    "Microsoft.SkypeApp",
    "Microsoft.BingWeather",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.Getstarted",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftStickyNotes"
)

# Loop through each app and attempt to remove it
foreach ($app in $bloatwareApps) {
    Write-Host "Attempting to remove $app..."
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
    if ($?) {
        Write-Host "$app removed successfully." -ForegroundColor Green
    } else {
        Write-Host "Failed to remove $app." -ForegroundColor Red
    }
}

Write-Host "Bloatware removal process completed."
