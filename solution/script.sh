#!/bin/bash

# LAB-01 · Backup de logs
# Crea un archivo comprimido con fecha

# Carpeta de logs (real o simulada)
LOG_DIR="./logs"

# Si existe /var/log y tenemos permisos, usarla
if [ -d "/var/log" ] && [ -r "/var/log" ]; then
  LOG_DIR="/var/log"
fi

# Fecha actual
DATE=$(date +"%Y-%m-%d")

# Nombre del backup
BACKUP_NAME="logs-backup-${DATE}.tar.gz"

echo "📦 Creando backup de logs desde: $LOG_DIR"
echo "📁 Archivo de salida: $BACKUP_NAME"

# Crear el backup (sin borrar originales)
tar -czf "$BACKUP_NAME" "$LOG_DIR"

# Verificar resultado
if [ $? -eq 0 ]; then
  echo "✅ Backup creado correctamente"
  ls -lh "$BACKUP_NAME"
else
  echo "❌ Error al crear el backup"
  exit 1
fi
