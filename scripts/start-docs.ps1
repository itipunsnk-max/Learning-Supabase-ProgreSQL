$ErrorActionPreference = 'Continue'

$projectRoot = Split-Path -Parent $PSScriptRoot
$url = 'http://127.0.0.1:5173/'
$logPath = Join-Path $projectRoot 'dev-server.log'
$errorLogPath = Join-Path $projectRoot 'dev-server.error.log'

# Stop only CMMS VitePress processes from this project.
$processes = Get-CimInstance Win32_Process | Where-Object {
    $_.ProcessId -ne $PID -and
    $_.CommandLine -and
    $_.CommandLine.Contains($projectRoot) -and
    ($_.CommandLine -match 'vitepress|npm\.cmd.*run dev|vitepress dev docs')
}

foreach ($process in $processes) {
    Stop-Process -Id $process.ProcessId -Force -ErrorAction SilentlyContinue
}

Start-Sleep -Seconds 1

$cmdLine = 'npm.cmd run dev -- --host 127.0.0.1 --force > dev-server.log 2> dev-server.error.log'
Start-Process -FilePath $env:ComSpec `
    -ArgumentList @('/d', '/s', '/c', $cmdLine) `
    -WorkingDirectory $projectRoot `
    -WindowStyle Hidden | Out-Null

$ready = $false
for ($attempt = 1; $attempt -le 30; $attempt++) {
    Start-Sleep -Seconds 1
    try {
        $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 2
        if ($response.StatusCode -eq 200) {
            $ready = $true
            break
        }
    } catch {
        # The server is still starting.
    }
}

if (-not $ready) {
    Write-Host 'VitePress did not become ready within 30 seconds.' -ForegroundColor Red
    if (Test-Path $errorLogPath) { Get-Content -LiteralPath $errorLogPath -Tail 30 }
    exit 1
}

Start-Process $url | Out-Null
Write-Host "Opened $url" -ForegroundColor Green
