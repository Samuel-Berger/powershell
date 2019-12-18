# Powershell

## Första genomgången

* PowerShell ISE ger utvecklingsmiljön, tänk som Python interpreter.  
Fördel med Powershell är att det finns mycket moduler för att tala med
det som ska integreras mot.

* Powershell 7 är inte samma som Windows Powershell.
* Körs uppifrån och ned, ingen main() behövs.
* Alla funktioner skrivs först. Detta för att de ska vara tillgängliga vid anrop.
* Det finns funktioner för att signera skript så att bara den som signerat/skrivit kan köra koden.
* Funktioner börjar ofta med Get, Set, New
  * samt är uppbyggda som verb-subjekt.
* Felhantering: try, catch, finally
* Normalt sett är Powershell otypat, men det går att ange datatyp.
  * Att ange datatyp kan vara bra vid till exempel uträkningar.
  Annars kan till exempel division bara ge heltal istället för decimaltal
  om inte uträkningen går jämt ut.

## Diverse kommandon och växlar

* get-help | [kommando]
  * som till exempel  `get-help Get-Current`
  * För att uppdatera hjälpen, kör som administratör `Update-Help`
* Kör du skriptet som administratör, går det att lägga på `-bypass` på ett kommando
för att gå undan kontroller
* Lägg på `-WhatIf` för att ibland kunna se vad koden gör när den körs.
  * som till exempel `Update-Help -WhatIf`

## Teams

Teams.ps1 är ett enkelt skript för att logga in på Teams och se vilka grupper en användare
är medlem av.

[cmdlet reference for Teams](https://docs.microsoft.com/sv-se/powershell/module/teams/)

## Osorterat

| Get-Member -MemberType All ger allt som tillhör för att se
| Where-Object {$_.name -notlike "*Copy"}

<https://channel9.msdn.com/Series/Getting-Started-with-Microsoft-PowerShell>  
<https://github.com/xpatohr/ps-barium>  
<https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_commonparameters?view=powershell-6>
