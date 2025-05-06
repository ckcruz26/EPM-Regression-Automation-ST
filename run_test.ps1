# Get the root directory (the parent directory of the script)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$venvPath = Join-Path $scriptDir "myvenv\Scripts\Activate.ps1"
$reportDir = Join-Path $scriptDir "report"
$testDir = Join-Path $scriptDir "test"

# Activate the virtual environment
. $venvPath

# Run Robot Framework tests
robot --outputdir $reportDir $testDir $args
