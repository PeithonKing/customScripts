$p=@"
# For Predictive text
Set-PSReadlineOption -PredictionSource History

# Aliases
Set-Alias unzip Expand-Archive  # unzip
Set-Alias nano notepad  # nano
"@

Write-Output $p >> $profile