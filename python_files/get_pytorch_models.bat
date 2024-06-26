@echo off
setlocal enabledelayedexpansion

rem Definir los URLs de los archivos a descargar
set "urls[0]=https://huggingface.co/AprendeIngenia/bill_bank_co/resolve/main/models/billBank2.pt?download=true"
set "urls[1]=https://huggingface.co/AprendeIngenia/bill_bank_co/resolve/main/models/yolov8l.pt?download=true"

rem Definir los nombres de los archivos
set "archivos[0]=billBank2.pt"
set "archivos[1]=yolov8l.pt"

rem Definir la carpeta de destino
set "carpeta=Modelos"

rem Crear la carpeta de destino si no existe
if not exist "%carpeta%" (
    mkdir "%carpeta%"
)

rem Descargar cada archivo si no está presente
for /L %%i in (0,1,2) do (
    rem Verificar si el archivo ya existe
    if not exist "%carpeta%\!archivos[%%i]!" (
        echo Descargando !archivos[%%i]!...
        powershell -command "(New-Object Net.WebClient).DownloadFile('!urls[%%i]!', '%carpeta%\!archivos[%%i]!')"
    ) else (
        echo Archivo !archivos[%%i]! ya existe. Omitiendo descarga.
    )
)

echo Descarga completada en la carpeta %carpeta%.
pause