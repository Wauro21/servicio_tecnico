:: Se comprueba si se tiene privilegios de administrador
powershell $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());if(-not($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))){Write-Host "¡Usted no posee privilegios de administrador! Cierre esta ventana para reintentar." ;while(1)}
::Conseguir mejor manera de tener directorio, no asumirlo
ECHO "Iniciando SCRIPT"
SET address=%cd%\script.ps1
powershell address
ECHO "El equipo eliminara el script y cerrara sesion a continuacion"
::CIERRE DE SESION
::ELIMINACION SCRIPT
PAUSE
