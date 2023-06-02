param (
    [Parameter(Mandatory = $false, Position = 0)]
    [ValidateScript({ Test-Path $_ })]
    [string]$FileName,

    [Parameter(Mandatory = $false, Position = 1)]
    [Alias("to")]
    [string]$Server,

    [Parameter(Mandatory = $false, Position = 2)]
    [Alias("at")]
    [string]$RemotePath
)

if ($RemotePath -and $Server -and $FileName) {
    if (Test-Path $FileName -PathType Container) {
        $scpCommand = "scp -r $FileName aritra@$Server" + ":" + $RemotePath
    }
    else {
        $scpCommand = "scp $FileName aritra@$Server" + ":" + $RemotePath
    }
    Invoke-Expression -Command $scpCommand
    # Write-Host $scpCommand
    return
}
elseif (-not $RemotePath -and -not $Server -and -not $FileName) {
    Write-Host "Usage: send <file/folder> -to <server> -at <remote-path>"
    Write-Host "Parameters:"
    Write-Host "  <file/folder>        The file/folder to be sent."
    Write-Host "  <server>             The server to send the file to."
    Write-Host "  <remote-path>        The remote path to send the file to."
}
else { Write-Host "All parameters are required." }
