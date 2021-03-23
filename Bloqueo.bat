@echo off & setlocal DisableDelayedExpansion
set counter=4
:Start
if %counter% equ 0 goto :LOCKOUT
Mode 50, 30 & color 0e
echo Ingresa usuario y contrase;a
set /p input= Usuario:

set "psCommand=powershell -Command "$pword = read-host 'Contrase;a' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
)

if %input%==celsa149 (
if %password%==julio1973 goto :Sucess
)
goto :2

:LOCKOUT
echo Cuenta bloqueada 80000
timeout /t 80000
goto :Start


:2
echo.
set /a counter -=1
echo.
@echo on
@echo off
color a0
echo Credenciales invalidas
echo.
if %counter% lss 4 echo %counter% attempts left
pause
goto :Start


:Sucess
Echo Usuario autenticado
color 0a
pause
goto :menu

:menu
echo 1)Bloquear
echo 2)Desbloquear


echo.
echo Selecciona una opcion

set/p Choice=:
if %choice%==1 goto :LOCK

pause
if %choice%==2 goto :UNLOCK
pause

:LOCK
DEL C:\Windows\System32\drivers\etc\hosts
COPY C:\Windows\LOCK\hosts C:\Windows\System32\drivers\etc
netsh advfirewall firewall add rule name="BlockProgram" dir=out program="C:\Users\Olivas\AppData\Local\Discord\app-0.0.309\Discord" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=in program="C:\Users\Olivas\AppData\Local\Discord\app-0.0.309\Discord" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=out program="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\EpicGamesLauncher.exe" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=in program="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\EpicGamesLauncher.exe" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=out program="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\UnrealEngineLauncher.exe" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=in program="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\UnrealEngineLauncher.exe" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=out program="C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteLauncher.exe" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=in program="C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteLauncher.exe" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=out program="C:\Users\Olivas\AppData\Roaming\.minecraft\" profile=any action=block
netsh advfirewall firewall add rule name="BlockProgram" dir=in program="C:\Users\Olivas\AppData\Roaming\.minecraft\TLauncher.exe" profile=any action=block

echo.
C:\Users\Olivas\AppData\Roaming\.minecraft\
pause

:UNLOCK
DEL C:\Windows\System32\drivers\etc\hosts
COPY C:\Windows\UNLOCK\hosts C:\Windows\System32\drivers\etc
netsh advfirewall firewall delete rule name= "BlockProgram" program="C:\Users\Olivas\AppData\Local\Discord\app-0.0.309\Discord.exe"
netsh advfirewall firewall delete rule name= "BlockProgram" program="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\EpicGamesLauncher.exe"
netsh advfirewall firewall delete rule name= "BlockProgram" program="C:\Program Files (x86)\Epic Games\Launcher\Engine\Binaries\Win64\UnrealEngineLauncher.exe"
netsh advfirewall firewall delete rule name= "BlockProgram" program="C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\UnrealEngineLauncher.exe"
netsh advfirewall firewall delete rule name= "BlockProgram" program="C:\Users\Olivas\AppData\Roaming\.minecraft\TLauncher.exe"
goto menu
