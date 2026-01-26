# Marco Tecnológico

## 1. Alcance del proyecto

### 1.1 Alcance funcional

El proyecto consiste en el diseño, implementación y configuración de una **infraestructura de servidor web** destinada a alojar una plataforma web informativa para un taller especializado en restauración y personalización de motocicletas. El objetivo principal es proporcionar una solución estable, segura y fácilmente recuperable ante fallos, priorizando la administración de sistemas frente al desarrollo de la aplicación.

Se incluye dentro del alcance del proyecto:
- Despliegue de una página web informativa mediante WordPress.
- Publicación de servicios ofrecidos y proyectos realizados.
- Implementación de una galería de imágenes.
- Inclusión de información de contacto y localización.
- Gestión básica de contenidos mediante el panel de administración de WordPress.
- Publicación de la documentación técnica del proyecto a través de GitHub Pages.
- Configuración de mecanismos de seguridad y copias de seguridad a nivel de servidor.
- Infraestructura preparada para futuras ampliaciones.

Quedan excluidos del alcance:
- Implementación de comercio electrónico o sistemas de venta online.
- Gestión avanzada de inventario, pedidos o facturación.
- Integración con sistemas ERP o pasarelas de pago.
- Desarrollo de funcionalidades avanzadas o personalizadas en WordPress.

---

### 1.2 Alcance técnico

El proyecto se basa en tecnologías de **código abierto**, alineadas con los contenidos del ciclo formativo de **Administración de Sistemas Informáticos en Red (ASIR)** y ampliamente utilizadas en entornos profesionales.

Las tecnologías y plataformas seleccionadas son:
- **Sistema operativo:** Ubuntu Server  
- **Plataforma de virtualización/contenedores:** Docker  
- **Servidor web:** Apache  
- **CMS:** WordPress  
- **Sistema gestor de bases de datos:** MySQL  
- **Lenguajes:** PHP, SQL  
- **Control de versiones:** Git y GitHub  
- **Documentación técnica:** GitHub Pages  
- **Automatización:** scripts del sistema y tareas programadas (cron)

#### Justificación de la plataforma de virtualización

Se ha seleccionado Docker como entorno de virtualización por los siguientes motivos:
- Permite el aislamiento de servicios mediante contenedores independientes.
- Facilita la instalación, mantenimiento y replicabilidad del entorno.
- Reduce el impacto de fallos en el sistema base.
- Optimiza el uso de recursos frente a máquinas virtuales tradicionales.
- Se ajusta al alcance académico del proyecto y a los objetivos del módulo ASIR.

---

### 1.3 Alcance temporal

El proyecto se desarrollará en las siguientes fases:

1. **Planificación y análisis**  
   Definición del contexto, objetivos y requisitos del sistema.  
   Entregable: documentación inicial del proyecto.

2. **Implementación del entorno de sistemas**  
   Instalación y configuración de Ubuntu Server, despliegue del entorno Docker y configuración de Apache, MySQL y WordPress.  
   Entregable: entorno servidor operativo.

3. **Seguridad, copias de seguridad y documentación**  
   Aplicación de medidas de seguridad, configuración de HTTPS, automatización de copias de seguridad y publicación de la documentación técnica.  
   Entregable: sistema validado y documentación final.

Los principales hitos del proyecto son:
- **Hito 1:** servidor configurado con servicios funcionales.
- **Hito 2:** sistema seguro, documentado y listo para entrega.

---

### 1.4 Alcance de recursos

#### Equipo y roles
- **Alumno (administrador de sistemas):** responsable del diseño, configuración, automatización y documentación del sistema.
- **Tutor del proyecto:** supervisión y validación de los entregables.

#### Presupuesto estimado

El proyecto se desarrolla utilizando exclusivamente software libre y servicios gratuitos:
- Ubuntu Server, Docker, Apache, MySQL y WordPress.
- GitHub y GitHub Pages para control de versiones y documentación.

El coste económico del proyecto es **nulo**, limitándose al uso del equipo personal del alumno y conexión a internet.

---

## 2. Requisitos del sistema

### 2.1 Requisitos funcionales (RF)

- **RF-001:** El sistema debe permitir la gestión de contenidos informativos mediante un CMS.
- **RF-002:** El sistema debe permitir la visualización estructurada de servicios y proyectos.
- **RF-003:** El sistema debe disponer de un panel básico de administración del contenido.

---

### 2.2 Requisitos no funcionales (RNF)

- **RNF-001:** El sistema debe garantizar un tiempo de carga adecuado para el acceso web.
- **RNF-002:** El sitio web debe ser accesible desde distintos dispositivos (diseño responsive).
- **RNF-003:** El sistema debe disponer de **copias de seguridad completas a nivel de servidor**, que permitan la recuperación ante fallos físicos o lógicos.
- **RNF-004:** El sistema debe garantizar comunicaciones seguras mediante el uso de **HTTPS**.

---

### 2.3 Requisitos de negocio (RN)

- **RN-001:** Mejorar la visibilidad online del taller y su presencia digital.
- **RN-002:** Cumplir con la normativa vigente en materia de protección de datos (RGPD/LOPD).

---

## 3. Especificación de requisitos por módulos

### 3.1 ASGBD – Administración de Sistemas Gestores de Bases de Datos
- Instalación y configuración del sistema gestor de bases de datos MySQL.
- Creación y gestión de la estructura de base de datos utilizada por WordPress.
- Configuración de usuarios y permisos.
- Inclusión de la base de datos en las copias de seguridad del servidor.

---

### 3.2 ASO – Administración de Sistemas Operativos
- Instalación y configuración de Ubuntu Server en entorno Docker.
- Gestión de usuarios, permisos y políticas básicas de seguridad.
- Configuración y control de servicios del sistema (Apache y MySQL).
- Automatización de tareas administrativas mediante scripts y cron.
- Implementación de copias de seguridad completas del entorno.

---

### 3.3 IAW – Implantación de Aplicaciones Web
- Instalación y configuración del servidor web Apache.
- Instalación y configuración de WordPress.
- Administración de usuarios del CMS.
- Conexión entre WordPress y la base de datos MySQL.
- Personalización básica de la aplicación web.

---

### 3.4 Servicios de Red e Internet
- Configuración de acceso remoto seguro mediante SSH.
- Configuración de DNS básico o uso de DNS externo.
- Publicación del servicio web mediante Apache.

---

### 3.5 Seguridad y Alta Disponibilidad
- Configuración de firewall básico mediante ufw o reglas de red Docker.
- Implementación de certificados SSL mediante **Let’s Encrypt**.
- Configuración de Apache para forzar el uso de HTTPS.
- Análisis básico de amenazas y aplicación de medidas de protección.
- Aislamiento de servicios mediante redes Docker personalizadas.
- Protección frente a pérdida de datos mediante copias de seguridad a nivel de servidor.

---

## 4. Matriz de trazabilidad de requisitos

La matriz de trazabilidad permite relacionar los requisitos definidos con los módulos del ciclo formativo de ASIR, asegurando la coherencia entre los objetivos del proyecto, los contenidos formativos y los entregables finales.
