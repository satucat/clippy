# Define the target directory within the user's Documents folder
# Thanks to ChatGPT (I do not know Powershell at all..)
# This location typically does not require administrator privileges
$targetDirectory = "$env:USERPROFILE\Documents\clippy"

# --- Create the Directory ---
# Check if the directory exists first (optional, but good practice)
if (-not (Test-Path -Path $targetDirectory -PathType Container)) {
    Write-Host "Creating directory: $targetDirectory"
    # Create the directory. -Force creates parent directories if needed (though not needed here).
    New-Item -Path $targetDirectory -ItemType Directory -Force | Out-Null
} else {
    Write-Host "already exists: $targetDirectory"
    Write-Host "skipped downloading, for the SSD and the young innocent soul"
    cd "$env:USERPROFILE\Documents\clippy"; .\clippy.exe
    return
}

# --- Download Files ---
# Note: Using the 'curl' alias for Invoke-WebRequest. Ensure paths are correctly quoted.

# Download clippy.exe
Write-Host "Downloading clippy.exe..."
curl -Uri "https://satu.ftp.sh/clippy/clippy.exe" -OutFile "$targetDirectory\clippy.exe" -UseBasicParsing

# Download mus_napstahouse.wav
Write-Host "Downloading mus_napstahouse.wav"
curl -Uri "https://satu.ftp.sh/clippy/mus_napstahouse.wav" -OutFile "$targetDirectory\mus_napstahouse.wav" -UseBasicParsing

# Download AxInterop.WMPLib.dll
Write-Host "Downloading AxInterop.WMPLib.dll"
curl -Uri "https://satu.ftp.sh/clippy/AxInterop.WMPLib.dll" -OutFile "$targetDirectory\AxInterop.WMPLib.dll" -UseBasicParsing

Write-Host "All downloads attempted."
Write-Host "Files should be in: $targetDirectory"

# Start the exe
cd "$env:USERPROFILE\Documents\clippy"; .\clippy.exe
