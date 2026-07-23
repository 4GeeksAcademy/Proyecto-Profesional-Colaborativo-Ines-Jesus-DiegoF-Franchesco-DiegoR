#!/usr/bin/env sh
# ============================================================
# build.sh — compila el CSS de Tailwind (v4) SIN instalar nada.
#
# ¿Qué hace? Tailwind lee src/input.css, mira qué clases se usan
# en los .html y genera css/styles.css con solo el CSS necesario.
#
# Uso (desde la raíz del proyecto):
#   sh build.sh          -> compila una vez, minificado
#   sh build.sh watch    -> recompila al vuelo mientras editas
#
# La primera vez descarga el binario oficial de Tailwind adecuado
# a tu ordenador (Mac o Linux) dentro de la carpeta bin/.
# ============================================================
set -e

BIN="./bin/tailwindcss"

# 1) Descargar el binario adecuado a la arquitectura si aún no existe
if [ ! -x "$BIN" ]; then
  mkdir -p bin
  OS="$(uname -s)"
  ARCH="$(uname -m)"
  case "$OS-$ARCH" in
    Darwin-arm64)   ASSET="tailwindcss-macos-arm64" ;;
    Darwin-x86_64)  ASSET="tailwindcss-macos-x64" ;;
    Linux-x86_64)   ASSET="tailwindcss-linux-x64" ;;
    Linux-aarch64)  ASSET="tailwindcss-linux-arm64" ;;
    *) echo "Arquitectura no soportada: $OS-$ARCH"; exit 1 ;;
  esac
  URL="https://github.com/tailwindlabs/tailwindcss/releases/latest/download/$ASSET"
  echo "Descargando $ASSET ..."
  curl -fsSL -o "$BIN" "$URL"
  chmod +x "$BIN"
fi

# 2) Compilar
if [ "$1" = "watch" ]; then
  "$BIN" -i ./src/input.css -o ./css/styles.css --watch
else
  "$BIN" -i ./src/input.css -o ./css/styles.css --minify
  echo "OK -> css/styles.css"
fi
