# Variable menú
$option = 0

# Admin o no
$Admin = [boolean] (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $Admin){
    $Init = Read-Host "Necesitas ejecutar este script como administrador, ejecutar (s/N)"

    if ($Init -ieq "s"){
        Start-Process -FilePath "powershell" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File", "`"$PSCommandPath`"" -Verb RunAs
        exit
    } else {
        Write-Error "El script debe ser ejecutado como administrador, Saliendo !!"
    }
} 

# Actualizar o no
$Update = Read-Host "Actualizar Windows Defender (s/n)"
if ($Update -eq 's'){
    Update-MpSignature
} 

# Función mostrar menú
function showmenu{
Write-Host "1. Escanear fichero"
Write-Host "2. Escanear directorio"
Write-Host "3. Salir"
}

# Estructura del menú
while ($option -ne '3'){
showmenu # Llamar al menú
$option = Read-Host "Introduce una opción"

if ($option -eq '1'){
    $fichero = Read-Host "Introduce el nombre del fichero"

    if (Test-Path $fichero){
        Start-MpScan -ScanPath $fichero -ScanType CustomScan
    } else {
        Write-Error "No se encuentra el fichero"
    }    
} 
elseif ($option -eq '2'){
    $rute = Read-Host "Introduce la ruta hacia el directorio"

    if (Test-Path $rute){
        Start-MpScan -ScanPath $rute -ScanType CustomScan
    } else {
        Write-Error "No se encuentra el directorio"
    }
} 
elseif ($option -eq '3'){
    Write-Host "Saliendoo !!"
}

else {
    Write-Host "Opción no válida"
    Clear-Host
}

}

