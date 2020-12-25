ECHO OFF
CLS

:: Se comprueba si se tiene privilegios de administrador

powershell $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());if(-not($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))){Write-Host "¡Usted no posee privilegios de administrador! Cierre esta ventana para reintentar." ;while(1){}}

powershell Set-ExecutionPolicy Unrestricted -Force

::Conseguir mejor manera de tener directorio, no asumirlo

ECHO Iniciando SCRIPT
SET address=%~dp0script.ps1
powershell %address%

::RESTAURACION DE SERVICIO SCRIPTS

powershell Set-ExecutionPolicy Restricted -Force
ECHO Se ha finalizado el cambio de usuario/contraseña. A continuacion se cerrara sesión y se limpiaran los archivos temporales, guarde todo el trabajo del equipo.

::ELIMINACION SCRIPT

DEL /f %address%
TIMEOUT /t 30

::CIERRE DE SESION

SHUTDOWN /l

::ELIMINACION BATCH

DEL "%~f0"
