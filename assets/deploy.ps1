# deploy.ps1 — automatise git add, commit et push pour le theme SouknDay (Windows / VS Code)
# Usage : .\deploy.ps1 "message du commit"
# Si aucun message n'est fourni, un message par defaut avec la date est utilise.

param(
    [string]$Message = "message_release $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
)

$ErrorActionPreference = "Stop"

try {
    Write-Host "-> Ajout des fichiers modifies..." -ForegroundColor Cyan
    git add .

    Write-Host "-> Commit : `"$Message`"" -ForegroundColor Cyan
    git commit -m "$Message"

    Write-Host "-> Push vers origin/master..." -ForegroundColor Cyan
    git push origin master

    Write-Host "Deploiement termine. Shopify va se synchroniser dans les prochaines secondes." -ForegroundColor Green
}
catch {
    Write-Host "Erreur pendant le deploiement : $_" -ForegroundColor Red
    exit 1
}
