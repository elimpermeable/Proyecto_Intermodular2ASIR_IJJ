# Desarrollo

En esta fase se ha llevado a cabo el despliegue completo de la infraestructura necesaria para el funcionamiento del sistema de gestión del taller **FHD Proyects**, utilizando servicios de **AWS** y contenedores **Docker** orquestados mediante **Docker Compose v2**.

---

## 1. Infraestructura en AWS

Se han desplegado **tres instancias EC2** en la región `us-east-1` con **Ubuntu Server 24.04 LTS**, cada una con una **Elastic IP** fija asociada.

| Instancia | IP | Tipo | Función |
|-----------|-----|------|---------|
| taller-fhd-principal | 3.217.215.112 | t3.medium | Servidor web, panel admin y base de datos |
| taller-fhd-dns | 18.213.221.53 | t3.micro | Servidor DNS con BIND9 |
| taller-fhd-backups | 54.165.242.48 | t3.micro | Servidor de copias de seguridad |


### Security Groups

Cada instancia dispone de su propio Security Group con únicamente los puertos necesarios:

**Servidor principal:**

| Puerto | Protocolo | Origen    | Uso                           |
|--------|-----------|-----------|-------------------------------|
| 22     | TCP       | IP propia | Administración remota por SSH |
| 80     | TCP       | 0.0.0.0/0 | Redirección HTTP → HTTPS      |
| 443    | TCP       | 0.0.0.0/0 | Web pública WordPress (HTTPS) |
| 8081   | TCP       | 0.0.0.0/0 | Panel admin Laravel (HTTPS)   |

El puerto **3306 (MySQL) no está expuesto** en ningún momento.


**Servidor DNS:**

| Puerto | Protocolo | Origen    | Uso           |
|--------|-----------|-----------|---------------|
| 22     | TCP       | IP propia | SSH           |
| 53     | UDP       | 0.0.0.0/0 | Consultas DNS |
| 53     | TCP       | 0.0.0.0/0 | Consultas DNS |


**Servidor de backups:**

| Puerto | Protocolo | Origen           | Uso                            |
|--------|-----------|------------------|--------------------------------|
| 22     | TCP       | IP propia        | SSH administrador              |
| 22     | TCP       | 3.217.215.112/32 | Recepción de backups por rsync |


---

## 2. Estructura del proyecto

Todos los archivos de configuración se organizan bajo `/opt/taller` en el servidor principal:

```
/opt/taller/
├── docker-compose.yml          # Orquestador principal
├── .env                        # Credenciales y variables (nunca en Git)
├── backup.sh                   # Script de backup automático nocturno
├── nginx/
│   ├── conf.d/
│   │   └── default.conf        # Configuración del reverse proxy y HTTPS
│   └── certs/
│       ├── certpub.pem         # Certificado SSL público (Cloudflare)
│       └── certpriv.key        # Clave privada SSL (Cloudflare)
├── mysql/
│   └── init/
│       └── 01_init.sql         # Inicialización de BBD, usuarios y tablas
└── laravel/
    └── Dockerfile              # Imagen personalizada PHP 8.2
```

---

## 3. Docker Compose

El fichero `docker-compose.yml` define los cuatro servicios del sistema, la red interna privada `taller_network` y los tres volúmenes persistentes:

```yaml
services:

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
      - "8081:8081"
    volumes:
      - ./nginx/conf.d:/etc/nginx/conf.d:ro
      - ./nginx/certs:/etc/nginx/certs:ro
      - wordpress_files:/var/www/html:ro
      - laravel_app:/var/www/panel:ro

  wordpress:
    image: wordpress:fpm-alpine
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_NAME: ${WP_DB_NAME}
      WORDPRESS_DB_USER: ${WP_DB_USER}
      WORDPRESS_DB_PASSWORD: ${WP_DB_PASSWORD}
    depends_on:
      db:
        condition: service_healthy

  laravel:
    build:
      context: ./laravel
      dockerfile: Dockerfile
    environment:
      DB_CONNECTION: mysql
      DB_HOST: db
      DB_DATABASE: ${TALLER_DB_NAME}
      DB_USERNAME: ${TALLER_DB_USER}
      DB_PASSWORD: ${TALLER_DB_PASSWORD}
    depends_on:
      db:
        condition: service_healthy

  db:
    image: mysql:8.0
    volumes:
      - mysql_data:/var/lib/mysql
      - ./mysql/init:/docker-entrypoint-initdb.d:ro
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MYSQL_DATABASE: ${WP_DB_NAME}
    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      retries: 10

volumes:
  mysql_data:
  wordpress_files:
  laravel_app:

networks:
  taller_network:
    driver: bridge
```

Todas las credenciales se cargan desde el fichero `.env`, que nunca se sube al repositorio Git.

---

## 4. Nginx como Reverse Proxy con HTTPS

Nginx actúa como único punto de entrada desde el exterior. Enruta el tráfico según el **dominio** de la petición y fuerza HTTPS en todos los accesos mediante redirección 301:

- `fhdproyects.innc.link` → WordPress (web pública)
- `tallerfhd.gestiona` → Laravel + Filament (panel admin, solo DNS privado)

Los certificados SSL son **Cloudflare Origin Certificates** para `*.innc.link`, almacenados en `/opt/taller/nginx/certs/`.

---

## 5. Imagen personalizada de Laravel

Dado que Laravel 12 y Filament v3 requieren extensiones PHP adicionales, se creó una imagen personalizada a partir de `php:8.2-fpm-alpine` que incluye todas las dependencias necesarias, entre ellas `pdo_mysql`, `intl`, `gd` y `zip`, además de **Composer** para la gestión de paquetes.

La extensión `intl` requiere la dependencia del sistema `icu-dev`, que debe instalarse explícitamente antes de compilarla.

---

## 6. Base de datos

MySQL gestiona **dos bases de datos separadas** dentro del mismo contenedor:

- `wordpress` — datos del CMS, accedida por el usuario `wp_user`.
- `taller_motos` — datos del negocio, accedida por el usuario `laravel_user`.

La base de datos `taller_motos` contiene **cinco tablas** diseñadas completamente en español:

| Tabla | Descripción |
|-------|-------------|
| `clientes` | Nombre, apellidos, teléfono y email |
| `motos` | Matrícula, marca, modelo y cliente propietario |
| `reparaciones` | Motivo, solución, estado, fechas, km y precio |
| `mecanicos` | Nombre, apellidos, teléfono y estado activo |
| `lista_compra` | Material, cantidad, urgente y comprado |

Las relaciones entre tablas son: un cliente puede tener varias motos, y una moto puede tener varias reparaciones. Cada reparación tiene un mecánico asignado.

---

## 7. Panel de administración Laravel 12 + Filament v3

Tras el despliegue de los contenedores se instaló **Laravel 12** y **Filament v3** dentro del contenedor, generando cinco módulos de gestión del taller:

- **Clientes** — registro y búsqueda de clientes.
- **Motos** — vehículos vinculados a cada cliente.
- **Reparaciones** — historial de trabajos con estado, fechas y precios.
- **Mecánicos** — personal del taller con estado activo/inactivo.
- **Lista de compra** — materiales pendientes de adquirir, con prioridad urgente.

El panel es accesible en `https://tallerfhd.gestiona/admin` **únicamente desde equipos que tengan configurado el DNS privado**.

---

## 8. Servidor DNS con BIND9

Se desplegó una segunda instancia EC2 (`18.213.221.53`) con **BIND9** para proporcionar resolución de nombres propia e independiente de Cloudflare.

Se configuraron tres zonas DNS:

- `fhdproyects.innc.link` → `3.217.215.112`
- `fhdproyects-gestiona.innc.link` → `3.217.215.112`
- `tallerfhd.gestiona` → `3.217.215.112` (dominio inventado, solo existe en este DNS)

El portátil del administrador se configuró en `/etc/systemd/resolved.conf` para usar `18.213.221.53` como DNS primario, con `1.1.1.1` como fallback. Esto permite:

- Acceder a `tallerfhd.gestiona` desde el portátil aunque Cloudflare esté bloqueado.
- Demostrar resolución DNS propia en el entorno del centro educativo.
- Mantener la accesibilidad pública del dominio WordPress desde cualquier dispositivo.

---

## 9. Sistema de copias de seguridad automáticas

Se desplegó una tercera instancia EC2 (`54.165.242.48`) dedicada exclusivamente a recibir copias de seguridad.

Se configuró una **conexión SSH sin contraseña** entre el servidor principal y el servidor de backups mediante una clave RSA dedicada generada en el servidor principal.

El script `/opt/taller/backup.sh` realiza automáticamente cada noche a las **2:00 AM** (programado con `cron`):

1. Volcado de la base de datos `wordpress` con `mysqldump`
2. Volcado de la base de datos `taller_motos` con `mysqldump`
3. Compresión de los archivos WordPress con `tar`
4. Compresión de la configuración `/opt/taller` con `tar`
5. Envío de todos los archivos al servidor de backups mediante `rsync` sobre SSH
6. Limpieza de archivos temporales locales

Cada backup incluye **fecha y hora** en el nombre del archivo. Los resultados quedan registrados en `/var/log/backup.log`.

---

## 10. Verificación del sistema

Una vez completado el despliegue se verificó el correcto funcionamiento de todos los servicios:

| URL | Resultado |
|-----|-----------|
| `https://fhdproyects.innc.link` | Web pública WordPress ✅ |
| `https://fhdproyects.innc.link/wp-admin` | Panel WordPress ✅ |
| `https://tallerfhd.gestiona/admin` | Login Filament ✅ |
| `https://tallerfhd.gestiona/admin/clientes` | Listado de clientes ✅ |
| `https://tallerfhd.gestiona/admin/motos` | Listado de motos ✅ |
| `https://tallerfhd.gestiona/admin/reparaciones` | Listado de reparaciones ✅ |
| `https://tallerfhd.gestiona/admin/mecanicos` | Listado de mecánicos ✅ |
| `https://tallerfhd.gestiona/admin/lista-compras` | Lista de compra ✅ |
| `dig @18.213.221.53 tallerfhd.gestiona` | Resuelve 3.217.215.112 ✅ |
| Backup nocturno en servidor independiente | Ejecutado correctamente ✅ |

Se comprobó también que los datos persisten tras reiniciar los contenedores y que MySQL **no es accesible desde el exterior** gracias al Security Group y a la red interna de Docker.

---

## 11. Conclusiones de la fase de desarrollo

El uso combinado de **AWS EC2**, **Elastic IP**, **Security Groups**, **Docker Compose**, **BIND9** y un sistema de backups automáticos ha permitido desplegar una infraestructura modular, segura y reproducible en la que cada servicio corre de forma aislada y puede ser mantenido o actualizado de forma independiente. La separación en tres instancias garantiza que un fallo en un servidor no afecte al resto del sistema.