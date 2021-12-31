# Copyrght 2021 - Sal Code
# Personal Microsoft PowerShell Setup

# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Parado

# Load prompt config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName}
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'sal.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression

# Aliases function and variables
function True-Commands
{
    cd ".\SAL CODE\True-Bot"
    code .
}

function True-WebSite
{
    cd ".\True Web Site"
    code .
}

function Get-Desktop-Path
{
    cd "C:\Users\Utente\OneDrive\Desktop"
}

function Get-SALCODE-Path
{
    cd "C:\Users\Utente\OneDrive\Desktop\SAL CODE"
}

function Touch-Command([string]$fileName)
{
    New-Item -ItemType File $fileName
}

function Move-Command([string]$fromPath, [string]$toPath)
{
    Move-Item $fromPath $toPath
}

function Start-Web-Scripts([string]$projectName)
{
    New-Item -ItemType Directory $projectName
    cd $projectName
    New-Item -ItemType Directory assets
    cd assets
    New-Item -ItemType Directory css
    cd css
    New-Item -ItemType File style.css
    cd ..
    New-Item -ItemType Directory images
    New-Item -ItemType Directory js
    cd js
    New-Item -ItemType File main.js
    cd ..
    New-Item -ItemType Directory scss
    cd scss

    $folders = "abstracts","base","layout","components","pages","themes"

    foreach ($folder in $folders){
        New-Item -ItemType Directory $folder
        cd $folder
        New-Item -ItemType File _index.scss
        cd ..
    }
    cd ..\..
    npm init -y
}

function Start-Bot-Scripts([string]$projectName)
{
    New-Item -ItemType Directory $projectName
    cd $projectName

    New-Item -ItemType File bot.js
    New-Item -ItemType File LICENSE
    New-Item -ItemType File CODEOWNERS
    New-Item -ItemType File README.md
    New-Item -ItemType File CODE_OF_CONDUCT.md
    New-Item -ItemType File .env
    New-Item -ItemType File .gitignore
    New-Item -ItemType File .eslint.json
    New-Item -ItemType File .prettierignore
    New-Item -ItemType File .prettierc.json

    "node_modules" | Out-File -FilePath .\.gitignore -Append
    ".env" | Out-File -FilePath .\.gitignore -Append
    "TOKEN=" | Out-File -FilePath .\.env

    New-Item -ItemType Directory src
    cd src
    New-Item -ItemType Directory commands
    New-Item -ItemType Directory errors
    cd ..

    npm init -y

    npm i discord.js
    npm i prettier --save-dev
    npm i eslint --save-dev
}

# Aliases

# Utility aliases
Set-Alias -Name start-web -Value Start-Web-Scripts -Description "Starts a website project"
Set-Alias -Name start-bot -Value Start-Bot-Scripts -Description "Starts a bot project"
Set-Alias -Name desktop -Value Get-Desktop-Path -Description "Moves into the Desktop"
Set-Alias -Name salcode -Value Get-SALCODE-Path -Description "Moves into the SAL CODE Directory"
Set-Alias -Name touch -Value Touch-Command -Description "Creates a file"
Set-Alias -Name m -Value Move-Command -Description "Moves a file/directory from an initial path to another one"

# True Bot Scripts
Set-Alias -Name true -Value True-Commands -Description "Runs a Visual Studio Code instance into True's directory"
Set-Alias -Name tws -Value True-WebSite -Description "Runs a Visual Studio Code instance into True's website directory"