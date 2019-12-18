#Check if the necessary module are installed.
if( Get-Module -ListAvailable -Name MicrosoftTeams) {
    #Write-Host "Module already installed."
}
else {
    #Install module as non-priviliged user.
    #Checks if the user is in the administrator group. Warns and stops if the user is not.
    #via https://danielengberg.com/check-if-powershell-script-is-running-as-administrator/
    try {
        if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
            Write-Host "Installing module as non-priviliegd user."
            Install-Module -Name MicrosoftTeams -Scope CurrentUser -ErrorAction Stop #install the module without privilieges.
        }
        #If administrator
        else {
            Write-Host "Installing module as administrator."
            Install-Module -Name MicrosoftTeams
        }
    }
    catch {
        Write-Host "Unable to install the required module MicrosoftTeams"
    }
    }
    #finally {
    #    Write-Host "Unable to install the required module MicrosoftTeam."
    #}

#Uncomment one of the two lines below.
#$accountId = "firstname.surname@zitac.se"  #Set the accountId, so you don't have to type it every time.
$accountId =  Read-Host -Prompt 'The e-mail used to connect to Microsoft Teams'    #Ask for account ID.

while (!($accountId)) {
    $accountId =  Read-Host -Prompt 'The e-mail used to connect to Microsoft Teams'
}

try {   #Try to connect to Teams using the provided account id.
    Write-Host "Connecting to Teams"
    Connect-MicrosoftTeams -AccountId $accountId -ErrorAction Stop #Get pop-up to log in of the user to be handled.
}
catch {
    Write-Host "Unable to log in to Teams."
    break
}

Write-Host "The user" $accountId "belongs to the following Teams:"
Get-Team -User $accountId #https://docs.microsoft.com/sv-se/powershell/module/teams/get-team?view=teams-ps#examples
Disconnect-MicrosoftTeams
