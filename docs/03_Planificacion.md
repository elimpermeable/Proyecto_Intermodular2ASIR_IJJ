# Planificación

## 1. Planificación del proyecto

La planificación del proyecto se ha organizado en función de un equipo de trabajo compuesto por tres integrantes.  
Cada miembro asume un rol principal, aunque existe colaboración puntual entre roles para garantizar la coherencia y la correcta integración del proyecto.

### 1.1 Organización del equipo y roles

El equipo de trabajo se estructura en los siguientes roles principales:

- **Responsable de infraestructura y sistemas**
- **Responsable de la base de datos**
- **Responsable de diseño de aplicaciones y seguridad**

A cada rol se le asigna un integrante del equipo:

- **Jesús**: responsable de la instalación, administración y mantenimiento tanto del host Ubuntu Server 24.04 como de las redes, contenedores Docker, servidor DNS y sistema de copias de seguridad.
- **Jose Carlos**: responsable de la creación, mantenimiento y gestión de la base de datos, adaptada a las necesidades del taller.
- **Israel**: responsable del diseño de la página web y de la seguridad perimetral del servidor mediante Security Groups de AWS.
- **Tutor del proyecto**: supervisión y validación de los entregables.

---

### 1.2 Distribución de roles y responsabilidades

#### Rol 1: Responsable de infraestructura y sistemas

Este rol se encarga del diseño, implementación y mantenimiento de la infraestructura técnica del proyecto, incluyendo las tres instancias EC2, Docker, sus contenedores, volúmenes, el servidor DNS y el sistema de backups.

**Funciones principales:**

- Instalación y configuración del sistema operativo Ubuntu Server 24.04 en las tres instancias EC2.
- Asignación de Elastic IPs y configuración de Security Groups en AWS.
- Instalación y configuración de Docker Engine + Docker Compose v2.
- Diseño de la arquitectura de contenedores y red interna `taller_network`.
- Configuración de volúmenes persistentes para contenedores.
- Implementación y configuración del servidor DNS con BIND9.
- Creación de zonas DNS para los dominios del taller.
- Implementación del sistema de copias de seguridad automáticas con `mysqldump`, `rsync` y `cron`.
- Configuración del acceso remoto seguro mediante SSH con claves RSA.
- Gestión de certificados SSL de Cloudflare para habilitar HTTPS.

---

#### Rol 2: Responsable de la base de datos

Este rol se centra en la implantación y la gestión de la base de datos.

**Funciones principales:**

- Instalación y configuración del contenedor de MySQL 8.0.
- Diseño y creación de las dos bases de datos: `wordpress` y `taller_motos`.
- Definición de tablas, claves primarias y claves foráneas en español.
- Creación del esquema relacional con 5 tablas: clientes, motos, reparaciones, mecánicos y lista de compra.
- Integración de WordPress con la base de datos MySQL.
- Integración de Laravel 12 con la base de datos `taller_motos` mediante Eloquent ORM.
- Gestión de usuarios y permisos con privilegios mínimos (`wp_user` y `laravel_user`).

---

#### Rol 3: Responsable de diseño de aplicación y seguridad

Este rol se encarga del diseño de la página WordPress, del panel de administración Laravel/Filament y de la seguridad perimetral del servidor.

**Funciones principales:**

- Diseño de la página web WordPress a nivel de frontend y backend.
- Instalación y configuración de Laravel 12 + Filament v3 como panel de administración privado.
- Creación de los módulos de gestión: Clientes, Motos, Reparaciones, Mecánicos y Lista de Compra.
- Verificación del correcto acceso a WordPress y al panel desde la web.
- Configuración de Security Groups de AWS para minimizar la exposición de puertos no deseados.

---

### 1.3 Planificación por fases

El desarrollo del proyecto se divide en las siguientes fases:

#### Fase 1: Análisis y planificación
- Definición del alcance del proyecto.
- Asignación de roles y responsabilidades.
- Análisis de requisitos funcionales y no funcionales.

#### Fase 2: Diseño técnico
- Diseño de la arquitectura del sistema con tres instancias EC2.
- Diseño de la infraestructura basada en contenedores Docker.
- Diseño del modelo de datos y del diagrama entidad–relación.
- Selección de dominios y planificación del servidor DNS.

#### Fase 3: Implementación
- Despliegue de las tres instancias EC2 en AWS.
- Configuración de Docker, redes y volúmenes en el servidor principal.
- Implantación de WordPress y MySQL.
- Instalación y configuración de Laravel 12 + Filament v3.
- Configuración del servidor DNS con BIND9.
- Implementación del sistema de backups automáticos nocturnos.

#### Fase 4: Seguridad y HTTPS
- Configuración de Security Groups específicos para cada instancia.
- Implementación de HTTPS con certificados Cloudflare Origin.
- Configuración de Nginx para redirección HTTP → HTTPS.
- Configuración del DNS privado para restringir el acceso al panel de Laravel.

#### Fase 5: Pruebas y validación
- Pruebas de funcionamiento de WordPress y Laravel/Filament.
- Validación del acceso a las bases de datos.
- Verificación del servidor DNS desde distintos escenarios de red.
- Comprobación del sistema de backups automáticos.

#### Fase 6: Documentación y entrega
- Redacción final de la documentación.
- Publicación en GitHub Pages.
- Preparación de la entrega final del proyecto.

---

### 1.4 Coordinación y herramientas de seguimiento

El equipo realiza reuniones periódicas para revisar el avance del proyecto, detectar incidencias y coordinar las tareas entre los distintos roles.  
Las decisiones técnicas relevantes se documentan y se consensúan entre los miembros del equipo.

Para el seguimiento de tareas se utiliza **Trello**:

![Tablero de Trello](images/trello.png)

[Enlace directo al tablero de Trello](https://trello.com/invite/b/692dd7425494b38fb1f97d27/ATTI911045e4e016ed353c414db31fc715d86DBA876E/proyecto-intermodular)

Además, como método de registro visual y cronológico, se dispone de un **diagrama de Gantt** que refleja los tiempos dedicados al avance del proyecto:

![Diagrama de Gantt](images/grant.png)