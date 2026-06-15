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

- Infraestructura cloud con tres instancias EC2, contenedores Docker y firewall perimetral (Security Groups).
- Servicios de red: DNS propio (BIND9), HTTPS y copias de seguridad automáticas en servidor independiente.
- Aplicaciones sobre la infraestructura: web pública (WordPress), panel de gestión interno (Laravel + Filament) y base de datos MySQL.
- Documentación técnica publicada en GitHub Pages.

> El detalle de arquitectura, configuración e implementación se desarrolla en los capítulos **Marco Tecnológico**, **Planificación** y **Desarrollo**.

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

El proyecto se organiza en cuatro fases principales — planificación, implementación de sistemas, servicios avanzados (DNS, HTTPS, backups) y validación con documentación — con seis fases de trabajo detalladas, asignación de roles y diagrama de Gantt en el capítulo **Planificación**.

Los hitos de entrega son:

- **Hito 1:** servidor principal operativo (Docker, aplicaciones y base de datos).
- **Hito 2:** servidor DNS resolviendo los dominios del taller.
- **Hito 3:** copias de seguridad automáticas nocturnas en servidor independiente.
- **Hito 4:** sistema validado, documentado y listo para entrega.

---

## 8. Especificación de requisitos por módulos

### 8.1 ASGBD – Administración de Sistemas Gestores de Bases de Datos
MySQL 8.0 en contenedor, dos bases de datos separadas (`wordpress` y `taller_motos`), esquema relacional del taller, usuarios con privilegios mínimos e integración con el sistema de backups.

### 8.2 ASO – Administración de Sistemas Operativos
Tres instancias Ubuntu Server 24.04 en AWS, orquestación con Docker Compose v2, redes y volúmenes persistentes, script de backup automatizado con `cron` y acceso SSH por clave.

### 8.3 IAW – Implantación de Aplicaciones Web
Nginx como reverse proxy con HTTPS, WordPress como CMS público y Laravel 12 + Filament v3 como panel de gestión privado.

### 8.4 Servicios de Red e Internet
Acceso remoto SSH, servidor DNS propio con BIND9, zonas para los dominios del taller y certificados SSL Cloudflare Origin.

### 8.5 Seguridad y Alta Disponibilidad
Security Groups de AWS, HTTPS forzado, matriz de vulnerabilidades, aislamiento de MySQL y copias de seguridad en servidor independiente.