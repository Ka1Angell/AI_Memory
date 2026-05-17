param(
    [Parameter(Mandatory=$true)]
    [string]$action
)

$date = Get-Date -Format "yyyy-MM-dd"
$time = Get-Date -Format "HH:mm"
$logFile = "C:\Users\ApaT\Documents\AI_Memory\Мои действия\$date.md"

$entry = "### $time - $action`n- Записано автоматически`n"

if (Test-Path $logFile) {
    $content = Get-Content $logFile -Raw
    if ($content -match '(?s)(## Сессия \d+)') {
        $newContent = $content -replace '(?s)(## Сессия \d+)', "$1$entry"
        [System.IO.File]::WriteAllText($logFile, $newContent, [System.Text.Encoding]::UTF8)
    }
} else {
    $header = "# Мои действия - $date`n`n## Сессия 1`n$entry"
    [System.IO.File]::WriteAllText($logFile, $header, [System.Text.Encoding]::UTF8)
}

cd "C:\Users\ApaT\Documents\AI_Memory"
git add .
git commit -m "Log: $action"
git push origin master 2>$null