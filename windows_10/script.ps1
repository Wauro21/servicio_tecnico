Write-Host "Bienvenido. Este SCRIPT tiene como función cambiar el nombre de usuario y la constraseña por defecto del equipo,siga las instrucciones que se mostraran a continuación."
Write-Host "-> Su sesión actual es: $env:UserName"

#Sistema de presione tecla para iniciar

$usuario = Read-Host "Ingrese el nuevo nombre de usuario para su equipo"
#Cambiar forma en que se consigue el nombre de usuaro actual
Rename-LocalUser -Name $env:UserName -NewName $usuario
#Completar
Write-Host "El nombre de usuario se ha actualizado"
#completar con el nombre de usuario actualizado

#Sistema para determinar si usuario quiere contraseña o no
#Codigo para cambiar contraseña:
$condition = 1 #para el While
While($condition){
  $password = Read-Host "Ingrese nueva contraseña"
    if($password -eq (Read-Host "Re-ingrese contraseña")){
    $condition = 0
    $password = ConvertTo-SecureString $password -AsPlainText -Force
    $UserAccount = Get-LocalUser -Name $usuario
    $UserAccount | Set-LocalUser -Password $password
    Write-Host "Se ha modificado la contraseña"
    }
    Else {
    Write-Host "¡Las contraseñas no coinciden!"
    }
}
