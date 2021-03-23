@echo off & setlocal DisableDelayedExpansion
set counter=4
:Start
if %counter% equ 0 goto :LOCKOUT
Mode 50, 30 & color 0e
echo Ingresa usuario y contrase;a
set /p input= Usuario:

set "psCommand=powershell -Command "$pword = read-host 'Contras;ea' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
      [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
        for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
)

if %input%==madre (
if %password%==123123 goto :Sucess
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
COPY %~d0\LOCK\hosts C:\Windows\System32\drivers\etc
echo.
pause

:UNLOCK
DEL C:\Windows\System32\drivers\etc\hosts
COPY %~d0\UNLOCK\hosts C:\Windows\System32\drivers\etc
goto menu
