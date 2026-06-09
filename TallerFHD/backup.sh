#!/bin/bash

# =====================================================
# Script de backup automático — Taller FHD
# Se ejecuta cada noche a las 2:00 AM
# =====================================================

# Variables
FECHA=$(date +%Y%m%d_%H%M%S)
SERVIDOR_BACKUP="ubuntu@54.165.242.48"
CLAVE_SSH="/home/ubuntu/.ssh/backup_key"
CARPETA_BACKUP="/opt/backups"
MYSQL_ROOT_PASS="692207628!Jesus"

echo "[$FECHA] Iniciando backup..."

# =====================================================
# 1. Backup base de datos WordPress
# =====================================================
echo "Haciendo backup de WordPress DB..."
docker compose -f /opt/taller/docker-compose.yml exec -T db \
    mysqldump -u root -p"$MYSQL_ROOT_PASS" wordpress \
    > /tmp/wordpress_$FECHA.sql

# =====================================================
# 2. Backup base de datos taller_motos
# =====================================================
echo "Haciendo backup de taller_motos DB..."
docker compose -f /opt/taller/docker-compose.yml exec -T db \
    mysqldump -u root -p"$MYSQL_ROOT_PASS" taller_motos \
    > /tmp/taller_motos_$FECHA.sql

# =====================================================
# 3. Backup archivos WordPress
# =====================================================
echo "Haciendo backup de archivos WordPress..."
docker run --rm \
    -v wordpress_files:/data \
    -v /tmp:/backup \
    alpine tar czf /backup/wordpress_files_$FECHA.tar.gz -C /data .

# =====================================================
# 4. Backup configuración /opt/taller
# =====================================================
echo "Haciendo backup de configuración..."
tar czf /tmp/config_$FECHA.tar.gz --exclude=/opt/taller/nginx/certs /opt/taller

# =====================================================
# 5. Enviar todo al servidor de backups
# =====================================================
echo "Enviando backups al servidor remoto..."
rsync -avz -e "ssh -i $CLAVE_SSH -o StrictHostKeyChecking=no" \
    /tmp/wordpress_$FECHA.sql \
    /tmp/taller_motos_$FECHA.sql \
    /tmp/wordpress_files_$FECHA.tar.gz \
    /tmp/config_$FECHA.tar.gz \
    $SERVIDOR_BACKUP:$CARPETA_BACKUP/

# =====================================================
# 6. Limpiar archivos temporales
# =====================================================
echo "Limpiando archivos temporales..."
rm -f /tmp/wordpress_$FECHA.sql
rm -f /tmp/taller_motos_$FECHA.sql
rm -f /tmp/wordpress_files_$FECHA.tar.gz
rm -f /tmp/config_$FECHA.tar.gz

echo "[$FECHA] Backup completado!"
