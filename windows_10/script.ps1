#Mensajes Pre-definidos

$greetMsg = "Bienvenido. Este SCRIPT le ayudara a cambiar su nombre de usuario y contrasena en Windows 10! Siga las instrucciones a continuacion:"
$dispSesionName = "-> Su nombre de usuario actual es: $env:UserName"
$newUserMsg = "Ingrese el nuevo nombre de usuario para su equipo: "

#Script
Write-Host $greetMsg
# Loop hasta que el usuario este satisfecho
$newUserNameConf = "n"
While($newUserNameConf -ne "y"){
    Write-Host $dispSesionName
    $usuario = Read-Host $newUserMsg
    $newUserNameConf = Read-Host "El nuevo nombre de usuario sera: $usuario < Confirma el nuevo nombre de usuario [y/n]? >"
}
Rename-LocalUser -Name $env:UserName -NewName $usuario

Write-Host "El nombre de usuario se ha actualizado"
#completar con el nombre de usuario actualizado

#Codigo para cambiar contraseña:
$condition = 1 #para el While
While($condition){
  $password = Read-Host "Ingrese nueva contraseña"
    if($password -eq (Read-Host "Re-ingrese contraseña")){
    $condition = 0
    If($password.length -ne 0){
        $password = ConvertTo-SecureString $password -AsPlainText -Force
    }
    Else{
        $password = [securestring]::new()
    }
    $UserAccount = Get-LocalUser -Name $usuario
    $UserAccount | Set-LocalUser -Password $password
    Write-Host "Se ha modificado la contraseña"
    }
    Else {
    Write-Host "¡Las contraseñas no coinciden!"
    }
}
