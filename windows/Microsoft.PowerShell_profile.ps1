oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/pure.omp.json" | Invoke-Expression
New-Alias g git
function vim {
    wsl vim $args
}
