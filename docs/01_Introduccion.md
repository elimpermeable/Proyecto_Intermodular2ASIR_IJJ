# Introducción

### **Título del reto**
**Despliegue de infraestructura web completa para un taller de personalización y restauración de motocicletas**

---

## 1. Contexto de la empresa / organización

El proyecto se plantea para un taller de reciente apertura situado en Crevillente, especializado en la restauración completa de motocicletas, fabricación de piezas personalizadas y mantenimiento general. Actualmente, el taller no cuenta con presencia digital, lo que dificulta que los potenciales clientes conozcan sus servicios, su ubicación y trabajos realizados. Debido a su reciente actividad, el taller busca mejorar su visibilidad y generar un canal de contacto accesible, así como disponer de herramientas internas para la gestión de su actividad diaria.

---

## 2. Problemática identificada

Actualmente, el taller presenta las siguientes limitaciones:

- No dispone de página web ni medios digitales formales.
- No existe un repositorio público de sus trabajos para mostrar calidad y experiencia.
- La comunicación con el cliente se realiza únicamente a nivel presencial o mediante mensajería móvil.
- No hay un punto de referencia donde consultar ubicación, horarios o servicios.
- No dispone de ningún sistema de gestión interna de clientes, motos o reparaciones.

Esta situación reduce su alcance comercial y limita la captación de nuevos clientes, especialmente aquellos que buscan referencias previas antes de contratar un servicio.

---

## 3. Objetivos del proyecto

### 3.1 Objetivo general
Desplegar una infraestructura completa, segura y escalable en la nube que proporcione al taller una presencia digital pública y un sistema privado de gestión interna, garantizando la disponibilidad, seguridad y continuidad del servicio.

### 3.2 Objetivos específicos
- Desplegar una página web pública mediante WordPress accesible con dominio propio y HTTPS.
- Implementar un panel de administración privado con Laravel y Filament para la gestión de clientes, motos, reparaciones y mecánicos.
- Configurar un servidor DNS propio con BIND9 para resolución de nombres tanto en red pública como en entornos con acceso restringido a internet.
- Implementar un sistema de copias de seguridad automáticas nocturnas en un servidor independiente.
- Documentar el proceso completo de implantación y publicarlo en GitHub Pages.

---

## 4. Identificación y clasificación de interesados

| Interesado | Rol | Interés en el proyecto | Nivel de influencia |
|---|---|---|---|
| Propietario del taller | Cliente principal | Captar clientes y gestionar el taller digitalmente | Alto |
| Futuro cliente del taller | Usuario final | Consultar servicios y datos de contacto | Medio |
| Mecánicos del taller | Usuario interno | Gestionar reparaciones desde el panel admin | Medio |
| Alumnos desarrolladores | Responsables del proyecto | Desarrollo y documentación técnica | Alto |
| Tutor del proyecto | Supervisor académico | Validar cumplimiento de objetivos | Alto |
| Centro educativo | Institución | Evaluación final del trabajo | Medio |

---

### 4.1 Mapa de interesados

| Categoría | Interesados |
|---|---|
| Alta influencia – Alto interés | Propietario del taller, Alumnos desarrolladores, Tutor |
| Alta influencia – Bajo interés | Centro educativo |
| Baja influencia – Alto interés | Clientes futuros, Mecánicos |
| Baja influencia – Bajo interés | Proveedores externos, otros talleres |

> La prioridad del proyecto se centra en el propietario del taller, en los requisitos académicos establecidos por el tutor y, de manera indirecta, en el futuro usuario final que consultará la web.

---

## 5. Alcance del proyecto

### 5.1 Alcance funcional

El proyecto consiste en el diseño, implementación y configuración de una **infraestructura de servidor completa** en la nube, compuesta por tres instancias independientes que dan servicio a una plataforma web pública, un panel de gestión privado y un sistema de backups automáticos. El objetivo principal es proporcionar una solución estable, segura y fácilmente recuperable ante fallos, priorizando la administración de sistemas frente al desarrollo de la aplicación.

Se incluye dentro del alcance del proyecto:

- Despliegue de una página web informativa mediante WordPress con dominio propio y HTTPS.
- Panel de administración privado con Laravel + Filament para gestión de clientes, motos, reparaciones y mecánicos.
- Lista de compra interna para gestión de materiales del taller.
- Servidor DNS propio con BIND9 que resuelve los dominios del taller de forma independiente a Cloudflare.
- Sistema de copias de seguridad automáticas nocturnas con rsync hacia un servidor independiente.
- Publicación de la documentación técnica del proyecto a través de GitHub Pages.

---

### 5.2 Alcance técnico

El proyecto se basa en tecnologías de **código abierto**, alineadas con los contenidos del ciclo formativo de **Administración de Sistemas Informáticos en Red (ASIR)** y ampliamente utilizadas en entornos profesionales.

Las tecnologías y plataformas seleccionadas son:

- **Sistema operativo:** Ubuntu Server 24.04 LTS
- **Plataforma de contenedores:** Docker + Docker Compose v2
- **Servidor web / Reverse proxy:** Nginx
- **CMS:** WordPress
- **Framework backend:** Laravel 12 + Filament v3
- **Sistema gestor de bases de datos:** MySQL 8.0
- **Servidor DNS:** BIND9
- **Infraestructura cloud:** AWS EC2 + Elastic IP
- **Certificados SSL:** Cloudflare Origin Certificates
- **Control de versiones:** Git y GitHub
- **Documentación técnica:** GitHub Pages

#### Justificación de la plataforma de contenedores

Se ha seleccionado Docker como entorno de virtualización por los siguientes motivos:

- Permite el aislamiento de servicios mediante contenedores independientes.
- Facilita la instalación, mantenimiento y replicabilidad del entorno.
- Reduce el impacto de fallos en el sistema base.
- Optimiza el uso de recursos frente a máquinas virtuales tradicionales.
- Se ajusta al alcance académico del proyecto y a los objetivos del módulo ASIR.

---

### 5.3 Presupuesto estimado

El proyecto se desarrolla utilizando software libre y servicios en capa gratuita de AWS, no obstante puede estar sujeto a costes en un entorno de producción real:

- Ubuntu Server, Docker, Nginx, MySQL, WordPress, Laravel y BIND9 son software libre y gratuito.
- GitHub y GitHub Pages para control de versiones y documentación son gratuitos.
- Las instancias EC2 `t3.micro` están dentro de la capa gratuita de AWS durante el primer año.
- Las Elastic IPs son gratuitas mientras estén asociadas a instancias en funcionamiento.

El coste del proyecto en su fase de desarrollo es **prácticamente nulo**, limitándose al uso del equipo personal del alumno y conexión a internet. Un despliegue en producción real conllevaría costes de dominio, instancias EC2 y almacenamiento adicional.

---

## 6. Requisitos del sistema

### 6.1 Requisitos funcionales (RF)

- **RF-001:** El sistema debe permitir la gestión de contenidos informativos mediante un CMS.
- **RF-002:** El sistema debe permitir la visualización estructurada de servicios y proyectos del taller.
- **RF-003:** El sistema debe disponer de un panel de administración privado para la gestión interna del taller.
- **RF-004:** El sistema debe permitir gestionar clientes, motos, reparaciones y mecánicos desde el panel.
- **RF-005:** El sistema debe disponer de un servidor DNS propio capaz de resolver los dominios del taller.
- **RF-006:** El sistema debe realizar copias de seguridad automáticas de las bases de datos y archivos críticos.

---

### 6.2 Requisitos no funcionales (RNF)

- **RNF-001:** El sistema debe garantizar un tiempo de carga adecuado para el acceso web.
- **RNF-002:** El sitio web debe ser accesible desde distintos dispositivos (diseño responsive).
- **RNF-003:** El sistema debe disponer de **copias de seguridad automáticas nocturnas** enviadas a un servidor independiente, que permitan la recuperación ante fallos físicos o lógicos.
- **RNF-004:** El sistema debe garantizar comunicaciones seguras mediante el uso de **HTTPS** con certificados válidos.
- **RNF-005:** El panel de administración debe ser accesible únicamente desde equipos configurados con el DNS privado del taller.

---

### 6.3 Requisitos de negocio (RN)

- **RN-001:** Mejorar la visibilidad online del taller y su presencia digital.
- **RN-002:** Proporcionar al taller una herramienta de gestión interna accesible y sencilla de usar.

---

## 7. Alcance temporal

El proyecto se desarrollará en las siguientes fases:

1. **Planificación y análisis**
   Definición del contexto, objetivos y requisitos del sistema.
   Entregable: documentación inicial del proyecto.

2. **Implementación del entorno de sistemas**
   Despliegue de las instancias EC2, configuración de Docker Compose, Nginx, WordPress, Laravel + Filament y MySQL.
   Entregable: entorno servidor operativo con panel de gestión funcional.

3. **Servicios avanzados**
   Configuración del servidor DNS con BIND9, implementación de HTTPS con certificados Cloudflare y despliegue del servidor de backups automáticos.
   Entregable: infraestructura completa con DNS, HTTPS y copias de seguridad.

4. **Seguridad y documentación**
   Revisión de seguridad, configuración de Security Groups, y publicación de la documentación técnica completa.
   Entregable: sistema validado y documentación final.

Los principales hitos del proyecto son:

- **Hito 1:** servidor principal configurado con WordPress y panel Laravel/Filament funcionales.
- **Hito 2:** servidor DNS operativo resolviendo los dominios del taller.
- **Hito 3:** sistema de backups automáticos nocurnos funcionando.
- **Hito 4:** sistema seguro, documentado y listo para entrega.

---

## 8. Especificación de requisitos por módulos

### 8.1 ASGBD – Administración de Sistemas Gestores de Bases de Datos
- Instalación y configuración del sistema gestor de bases de datos MySQL 8.0 en contenedor Docker.
- Creación de dos bases de datos separadas: `wordpress` para el CMS y `taller_motos` para la gestión interna.
- Diseño del esquema relacional de `taller_motos` con 5 tablas: clientes, motos, reparaciones, mecánicos y lista de compra.
- Configuración de usuarios con privilegios mínimos (`wp_user` y `laravel_user`).
- Inclusión de ambas bases de datos en el sistema de copias de seguridad automáticas.

---

### 8.2 ASO – Administración de Sistemas Operativos
- Instalación y configuración de Ubuntu Server 24.04 en tres instancias EC2 independientes.
- Gestión de usuarios, permisos y políticas básicas de seguridad.
- Configuración y control de servicios del sistema mediante Docker Compose v2.
- Implementación de copias de seguridad automáticas nocturnas con `mysqldump` y `rsync`.
- Automatización mediante `cron` para la ejecución del script de backup a las 2:00 AM.
- Aislamiento de servicios mediante redes Docker personalizadas.

---

### 8.3 IAW – Implantación de Aplicaciones Web
- Instalación y configuración del servidor web Nginx como reverse proxy.
- Instalación y configuración de WordPress como web pública del taller.
- Instalación y configuración de Laravel 12 + Filament v3 como panel de administración privado.
- Creación de modelos Eloquent y Resources de Filament para la gestión del taller.
- Administración de usuarios del CMS y del panel de administración.

---

### 8.4 Servicios de Red e Internet
- Configuración de acceso remoto seguro mediante SSH con autenticación por clave pública.
- Despliegue y configuración de servidor DNS propio con **BIND9** en instancia EC2 independiente.
- Creación de zonas DNS para `fhdproyects.innc.link` y `tallerfhd.gestiona`.
- Publicación del servicio web mediante Nginx con HTTPS.
- Implementación de certificados SSL mediante **Cloudflare Origin Certificates**.

---

### 8.5 Seguridad y Alta Disponibilidad
- Configuración de **Security Groups de AWS** como firewall perimetral para las tres instancias.
- Implementación de certificados SSL con **Cloudflare** para comunicaciones HTTPS.
- Configuración de Nginx para forzar el uso de HTTPS mediante redirección 301.
- Análisis de amenazas y aplicación de medidas de protección (matriz de vulnerabilidades).
- Protección frente a pérdida de datos mediante copias de seguridad automáticas en servidor independiente.
- Aislamiento de MySQL: puerto 3306 nunca expuesto al exterior, solo accesible desde red interna Docker.