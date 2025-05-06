# Get the root directory (the parent directory of the script)
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define the path to the virtual environment's Activate.ps1
$venvPath = Join-Path $scriptDir "myvenv\Scripts\Activate.ps1"

# Define the directories for reports and tests
$reportDir = Join-Path $scriptDir "report"
$testDir = Join-Path $scriptDir "test"


# Run Robot Framework tests with the output directory
robot --outputdir $reportDir $testDir $args
