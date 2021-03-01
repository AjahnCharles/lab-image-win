### WARNING ###
# Do not use setx to update the PATH because it will unwrap variables (e.g. %INTEL_DEV_REDIST%)


### Functions ###

function Create-Shortcut {
  param (
    [string]$Source,
    [string]$Destination
  )

  #New-Object : Creates an instance of a Microsoft .NET Framework or COM object.
  #-ComObject WScript.Shell: This creates an instance of the COM object that represents the WScript.Shell for invoke CreateShortCut
  $WScriptShell = New-Object -ComObject WScript.Shell
  $Shortcut = $WScriptShell.CreateShortcut($Destination)
  $Shortcut.TargetPath = $Source

  #Save the Shortcut to the TargetPath
  $Shortcut.Save()
}


### Setup ###
$devtools = if ($PSScriptRoot) { $PSScriptRoot } `
  elseif ($psise) { split-path $psise.CurrentFile.FullPath } `
  elseif ($psEditor) { split-path $psEditor.GetEditorContext().CurrentFile.Path }

if(!$devtools) {
  Write-Host "ERROR: Failed to detect location of `devtools` directory"
  Read-Host -Prompt "Quitting... (press 'Enter' to exit)"
  Return
}

Write-Host "Enabling scripts (for CLIs: node, firebase, vue, etc)"
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process PowerShell -ArgumentList 'Set-ExecutionPolicy RemoteSigned -Force' -Verb RunAs}"

# See https://developer.android.com/studio/command-line/variables
Write-Host "Setting Environment variables"
Write-Host $(setx ANDROID_SDK_HOME "${devtools}\android-home" /M)
Write-Host $(setx ANDROID_SDK_ROOT "${devtools}\android-sdk" /M)
Write-Host $(setx GRADLE_USER_HOME "${devtools}\gradle-home" /M)

Write-Host "Creating desktop shortcuts"
$Desktop = [Environment]::GetFolderPath("CommonDesktopDirectory")
Create-Shortcut "${devtools}\vscode\Code.exe" "${Desktop}\VSCode.lnk"
Create-Shortcut "${devtools}\android-studio\bin\studio64.exe" "${Desktop}\Android Studio.lnk"


### Update PATH ###

Write-Host "Updating PATH"

# Declare new PATH parts
$newPaths = @(
  "${devtools}\node",
  "${devtools}\npm-global",
  "${devtools}\vscode\bin",
  "${devtools}\git\bin"
)

# Get current PATH
$hklm = [Microsoft.Win32.Registry]::LocalMachine
$regPath = "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
$regKey = $hklm.OpenSubKey($regPath, $True)

$path = $regKey.GetValue("Path", "", [Microsoft.Win32.RegistryValueOptions]::DoNotExpandEnvironmentNames)

# Check if already contains parts
$pathLower = $path.ToLower()
Foreach ($newPath in $newPaths) {
  if ($pathLower.contains(";$($newPath.toLower());") -Or $pathLower.endsWith($newPath.toLower())) {
    # Write-Host "$newPath already in PATH"
  } else {
    Write-Host " Adding: $newPath"
    $path = $path + ";" + $newPath
  }
}

$path = $path.Replace(";;",";")

# Set updated PATH
$regKey.SetValue("Path", $path, [Microsoft.Win32.RegistryValueKind]::ExpandString)


### Keep Window Open ###

Write-Host ""
Read-Host -Prompt "Setup complete! (press 'Enter' to exit)"
