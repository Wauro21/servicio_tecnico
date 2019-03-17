:: Se comprueba si se tiene privilegios de administrador
powershell $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent());if(-not($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))){Write-Host "¡Usted no posee privilegios de administrador! Cierre esta ventana para reintentar.";while(1)
::Conseguir mejor manera de tener directorio, no asumirlo
ECHO "Iniciando SCRIPT"
powershell .\test.ps1
ECHO "El equipo eliminara el script y cerrará sesión a continuación"
::CIERRE DE SESION
::ELIMINACION SCRIPT
PAUSE
