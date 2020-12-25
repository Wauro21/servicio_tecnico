#Test
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding =
                    New-Object System.Text.UTF8Encoding

#Mensajes Pre-definidos

$greetMsg = "Bienvenido. ¡Este SCRIPT le ayudara a cambiar su nombre de usuario y contraseña en Windows 10! Siga las instrucciones a continuación:"
$dispSesionName = "-> Su nombre de usuario actual es: $env:UserName"
$newUserMsg = "Ingrese el nuevo nombre de usuario para su equipo: "
#Script
$newUserConfMsg = "El nuevo nombre de usuario será: $usuario < Confirma el nuevo nombre de usuario [y/n]? >"
Write-Host $greetMsg
# Loop hasta que el usuario este satisfecho
$newUserNameConf = "n"
While($newUserNameConf -ne "y"){
    Write-Host $dispSesionName
    $usuario = Read-Host $newUserMsg
    $newUserNameConf = Read-Host $newUserConfMsg
}
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
