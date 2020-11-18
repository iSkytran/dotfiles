[ScriptBlock]$Prompt = {
    $realLASTEXITCODE = $global:LASTEXITCODE
    if ($realLASTEXITCODE -isnot [int]) {
      $realLASTEXITCODE = 0
    }
    $startInfo = New-Object System.Diagnostics.ProcessStartInfo
    $startInfo.FileName = "C:\Users\rizci\.ohmyposh\oh-my-posh.exe"
    $cleanPWD = $PWD.ProviderPath.TrimEnd("\")
    $startInfo.Arguments = "-config=""C:\Users\rizci\.ohmyposh\poshthemes\paradox.json"" -error=$realLASTEXITCODE -pwd=""$cleanPWD"""
    $startInfo.Environment["TERM"] = "xterm-256color"
    $startInfo.CreateNoWindow = $true
    $startInfo.StandardOutputEncoding = [System.Text.Encoding]::UTF8
    $startInfo.RedirectStandardOutput = $true
    $startInfo.UseShellExecute = $false
    if ($PWD.Provider.Name -eq 'FileSystem') {
      $startInfo.WorkingDirectory = $PWD.ProviderPath
    }
    $process = New-Object System.Diagnostics.Process
    $process.StartInfo = $startInfo
    $process.Start() | Out-Null
    $standardOut = $process.StandardOutput.ReadToEnd()
    $process.WaitForExit()
    $standardOut
    $global:LASTEXITCODE = $realLASTEXITCODE
    Remove-Variable realLASTEXITCODE -Confirm:$false
}
Set-Item -Path Function:prompt -Value $Prompt -Force
