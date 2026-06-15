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
# Comprobar que MySQL NO está expuesto
nc -zv 3.217.215.112 3306

# Comprobar resolución DNS privada
dig @18.213.221.53 tallerfhd.gestiona

# Comprobar HTTPS
curl -I https://fhdproyects.innc.link
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

