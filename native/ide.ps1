<# Общая точка запуска из WebStorm и PowerShell. Все пути вычисляются от проекта;
Setup создаёт среду, Build собирает EXE, Test проверяет код и готовые сборки. #>
param(
    [ValidateSet('Setup', 'Build', 'Test', 'Run', 'RunFast')]
    [string]$Action = 'RunFast',
    [string]$PythonPath = ''
)
$ErrorActionPreference = 'Stop'
$pythonExecutable = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
Push-Location $PSScriptRoot
try {
    if ($Action -eq 'Setup') {
        if (-not (Test-Path -LiteralPath $pythonExecutable)) {
            if ($PythonPath) { & $PythonPath -m venv .venv }
            elseif (Get-Command py -ErrorAction SilentlyContinue) { & py -3 -m venv .venv }
            elseif (Get-Command python -ErrorAction SilentlyContinue) { & python -m venv .venv }
            else { throw 'Install Python 3.11+ with Tk, or pass -PythonPath.' }
            if ($LASTEXITCODE -ne 0) { throw 'Cannot create Python environment.' }
        }
        & $pythonExecutable -m pip install -r requirements-build.txt
        if ($LASTEXITCODE -ne 0) { throw 'Cannot install build dependencies.' }
    }
    elseif ($Action -in @('Run', 'RunFast')) {
        $executableName = if ($Action -eq 'RunFast') { 'TOK26-fast.exe' } else { 'TOK26.exe' }
        $executable = Join-Path $PSScriptRoot "dist\release\$executableName"
        if (-not (Test-Path -LiteralPath $executable)) { throw 'Build the application first.' }
        $application = Start-Process -FilePath $executable -PassThru -Wait
        if ($application.ExitCode -ne 0) { throw "Application exited with code $($application.ExitCode)." }
    }
    else {
        if (-not (Test-Path -LiteralPath $pythonExecutable)) { throw 'Run the Setup configuration first.' }
        if ($Action -eq 'Build') {
            & $pythonExecutable build.py --output-directory dist/release
            if ($LASTEXITCODE -ne 0) { throw 'Build failed.' }
        }
        else {
            & $pythonExecutable -m unittest -q test_tok test_fast_sync
            if ($LASTEXITCODE -ne 0) { throw 'Tests failed.' }
            & $pythonExecutable smoke_exe.py --binary-directory dist/release
            if ($LASTEXITCODE -ne 0) { throw 'Executable checks failed.' }
        }
    }
}
finally { Pop-Location }
