# ============================================================
# build.ps1 — compila el CSS de Tailwind (v4) en WINDOWS.
#
# Es el equivalente de build.sh (que solo funciona en Mac/Linux).
#
# ¿Qué hace? Tailwind lee src/input.css, mira qué clases se usan
# en los .html y genera css/styles.css con solo el CSS necesario.
#
# Uso (desde la raíz del proyecto, en PowerShell):
#   .\build.ps1          -> compila una vez, minificado
#   .\build.ps1 watch    -> recompila al vuelo mientras editas
#
# La primera vez descarga el binario oficial de Tailwind para
# Windows (~110 MB) dentro de la carpeta bin/, que está ignorada
# por Git. Las siguientes veces ya no lo descarga.
#
# Si PowerShell se queja al ejecutar el script, lanza antes:
#   Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
# ============================================================

$ErrorActionPreference = 'Stop'

$raiz = Split-Path -Parent $MyInvocation.MyCommand.Path
$bin  = Join-Path $raiz 'bin\tailwindcss.exe'

# 1) Descargar el binario si aún no existe
if (-not (Test-Path $bin)) {
    New-Item -ItemType Directory -Force (Join-Path $raiz 'bin') | Out-Null

    $arch  = $env:PROCESSOR_ARCHITECTURE
    $asset = if ($arch -eq 'ARM64') { 'tailwindcss-windows-arm64.exe' } else { 'tailwindcss-windows-x64.exe' }
    $url   = "https://github.com/tailwindlabs/tailwindcss/releases/latest/download/$asset"

    Write-Host "Descargando $asset (solo la primera vez, ~110 MB)..."
    $progreso = $ProgressPreference
    $ProgressPreference = 'SilentlyContinue'   # sin esta línea la descarga va muy lenta
    Invoke-WebRequest -Uri $url -OutFile $bin
    $ProgressPreference = $progreso
}

# 2) Compilar
$entrada = Join-Path $raiz 'src\input.css'
$salida  = Join-Path $raiz 'css\styles.css'

if ($args[0] -eq 'watch') {
    & $bin -i $entrada -o $salida --watch
} else {
    & $bin -i $entrada -o $salida --minify
    Write-Host "OK -> css/styles.css ($((Get-Item $salida).Length) bytes)"
}
