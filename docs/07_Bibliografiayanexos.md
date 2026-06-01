# Bibliografía y Anexos

## 1. Bibliografía

Recursos oficiales consultados durante el desarrollo del proyecto:

| Tecnología | Documentación oficial |
|------------|----------------------|
| AWS EC2 | https://docs.aws.amazon.com/ec2 |
| Docker | https://docs.docker.com |
| Docker Compose | https://docs.docker.com/compose |
| Nginx | https://nginx.org/en/docs |
| WordPress | https://developer.wordpress.org |
| Laravel 12 | https://laravel.com/docs/12.x |
| Filament v3 | https://filamentphp.com/docs |
| MySQL 8.0 | https://dev.mysql.com/doc/refman/8.0/en |
| BIND9 | https://bind9.readthedocs.io |
| Ubuntu Server | https://ubuntu.com/server/docs |

---

## 2. Anexos

### 2.1 Comandos útiles del día a día

Todos los comandos `docker compose` se ejecutan siempre desde `/opt/taller`.

```bash
# Ir a la carpeta del proyecto
cd /opt/taller

# Ver estado de los contenedores
docker compose ps

# Arrancar todos los contenedores
docker compose up -d

# Parar todos los contenedores
docker compose down

# Reiniciar un contenedor concreto
docker compose restart nginx
docker compose restart laravel

# Ver logs en tiempo real
docker compose logs -f laravel
docker compose logs -f nginx

# Entrar dentro de un contenedor
docker compose exec laravel bash
docker compose exec db bash

# Reconstruir imagen de Laravel (si se cambia el Dockerfile)
docker compose up -d --build laravel
```

```bash
# Consola MySQL del taller
docker compose exec db mysql -u laravel_user -p taller_motos

# Consola MySQL de WordPress
docker compose exec db mysql -u wp_user -p wordpress
```

```bash
# Ejecutar backup manualmente
sudo bash /opt/taller/backup.sh

# Ver log del último backup
cat /var/log/backup.log

# Ver archivos en el servidor de backups
ssh -i ~/.ssh/backup_key ubuntu@54.165.242.48 "ls -lh /opt/backups/"
```

```bash
# Cuando cambie la IP (si no hay Elastic IP)
sed -i "s|^APP_URL=.*|APP_URL=http://NUEVA-IP|" /opt/taller/.env

docker compose exec laravel bash -c \
  "sed -i 's|^APP_URL=.*|APP_URL=http://NUEVA-IP:8081|' .env && php artisan config:clear"

docker compose exec db mysql -u root -p wordpress -e \
  "UPDATE wp_options SET option_value='http://NUEVA-IP'
   WHERE option_name IN ('siteurl','home');"

docker compose down && docker compose up -d
```

---

### 2.2 Script de backup automático

Script completo ubicado en `/opt/taller/backup.sh`, ejecutado cada noche a las 2:00 AM por `cron`:

```bash
#!/bin/bash

# =====================================================
# Script de backup automático — Taller FHD
# Ejecutado cada noche a las 2:00 AM mediante cron
# =====================================================

FECHA=$(date +%Y%m%d_%H%M%S)
SERVIDOR_BACKUP="ubuntu@54.165.242.48"
CLAVE_SSH="/home/ubuntu/.ssh/backup_key"
CARPETA_BACKUP="/opt/backups"
MYSQL_ROOT_PASS="TuPasswordRoot"

echo "[$FECHA] Iniciando backup..."

# 1. Backup base de datos WordPress
echo "Haciendo backup de WordPress DB..."
docker compose -f /opt/taller/docker-compose.yml exec -T db \
    mysqldump -u root -p"$MYSQL_ROOT_PASS" wordpress \
    > /tmp/wordpress_$FECHA.sql

# 2. Backup base de datos taller_motos
echo "Haciendo backup de taller_motos DB..."
docker compose -f /opt/taller/docker-compose.yml exec -T db \
    mysqldump -u root -p"$MYSQL_ROOT_PASS" taller_motos \
    > /tmp/taller_motos_$FECHA.sql

# 3. Backup archivos WordPress
echo "Haciendo backup de archivos WordPress..."
docker run --rm \
    -v wordpress_files:/data \
    -v /tmp:/backup \
    alpine tar czf /backup/wordpress_files_$FECHA.tar.gz -C /data .

# 4. Backup configuración /opt/taller
echo "Haciendo backup de configuración..."
tar czf /tmp/config_$FECHA.tar.gz --exclude=/opt/taller/nginx/certs /opt/taller

# 5. Enviar todo al servidor de backups
echo "Enviando backups al servidor remoto..."
rsync -avz -e "ssh -i $CLAVE_SSH -o StrictHostKeyChecking=no" \
    /tmp/wordpress_$FECHA.sql \
    /tmp/taller_motos_$FECHA.sql \
    /tmp/wordpress_files_$FECHA.tar.gz \
    /tmp/config_$FECHA.tar.gz \
    $SERVIDOR_BACKUP:$CARPETA_BACKUP/

# 6. Limpiar archivos temporales
echo "Limpiando archivos temporales..."
rm -f /tmp/wordpress_$FECHA.sql
rm -f /tmp/taller_motos_$FECHA.sql
rm -f /tmp/wordpress_files_$FECHA.tar.gz
rm -f /tmp/config_$FECHA.tar.gz

echo "[$FECHA] Backup completado!"
```

Configuración del cron en el servidor principal:

```
0 2 * * * /bin/bash /opt/taller/backup.sh >> /var/log/backup.log 2>&1
```