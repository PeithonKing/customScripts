param (
    [Parameter(Mandatory = $false, Position = 0)]
    [string]$RemotePath,

    [Parameter(Mandatory = $false, Position = 1)]
    [Alias("from")]
    [string]$Server,

    [switch]$r
)

$localPath = (Get-Location).Path


if ($RemotePath -and $Server) {
    if ($r) {
        $scpCommand = "scp -r aritra@$Server" + ":" + "$RemotePath $localPath"
    }
    else {
        $scpCommand = "scp aritra@$Server" + ":" + "$RemotePath $localPath"
    }

    Invoke-Expression -Command $scpCommand
    # Write-Host $scpCommand
    return
}
elseif (-not $RemotePath -and -not $Server) {
    Write-Host "Usage: bring <file/folder> -from <server> [-r]"
    Write-Host "Parameters:"
    Write-Host "  <file/folder>        The file/folder REMOTE path to be brought."
    Write-Host "  <server>             The server to bring the file from."
    Write-Host "  [-r]                 Optional switch to enable recursive copying (for folders)."
}
else {Write-Host "Both RemotePath and Server parameters are required."}


