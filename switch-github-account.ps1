# GitHub Account Switcher Script
# Usage: .\switch-github-account.ps1 -Account "luckeygems" or "lakshmai"

param(
    [string]$Account = "luckeygems"
)

$accounts = @{
    "luckeygems" = @{
        "username" = "LuckeyGems"
        "email" = "luckeygems@example.com"
        "token" = "" # You'll set this manually from GitHub
    }
    "lakshmai" = @{
        "username" = "Lakshmai"
        "email" = "lakshmai@example.com"
        "token" = "" # You'll set this manually from GitHub
    }
}

if ($accounts.ContainsKey($Account)) {
    $acc = $accounts[$Account]
    
    Write-Host "Switching to $Account account..." -ForegroundColor Green
    
    # Set git config
    git config --global user.name $acc.username
    git config --global user.email $acc.email
    
    Write-Host "✓ Git user configured:" -ForegroundColor Green
    Write-Host "  Name: $(git config --global user.name)"
    Write-Host "  Email: $(git config --global user.email)"
    
    Write-Host ""
    Write-Host "to_store_token_for_this_account:" -ForegroundColor Yellow
    Write-Host "1. Go to GitHub.com Settings → Developer settings → Personal access tokens"
    Write-Host "2. Create a new token with 'repo' scope"
    Write-Host "3. When git prompts, enter: username=$($acc.username), password=(paste token)"
    Write-Host ""
    Write-Host "Or remove old credentials first with:" -ForegroundColor Cyan
    Write-Host "cmdkey /delete:LegacyGeneric:target=git:https://github.com"
    
} else {
    Write-Host "Unknown account: $Account" -ForegroundColor Red
    Write-Host "Available accounts: $($accounts.Keys -join ', ')"
}
