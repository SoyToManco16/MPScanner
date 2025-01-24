# Variable menú
$option = 0

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
    $fichero = Read-Host "Introduce el nombre del fichero: "
    C:\Program Files\Windows Defender\MpCmdRun.exe -Scan -Scantype 3 -File $fichero
} 
elseif ($option -eq '2'){
    $rute = Read-Host "Introduce la ruta hacia el directorio: "
    Start-MpScan -ScanPath $rute 
} 
elseif ($option -eq '3'){
    Write-Host "Saliendoo !!"
}

else {
    Write-Host "Opción no válida"
    clear
}

}

