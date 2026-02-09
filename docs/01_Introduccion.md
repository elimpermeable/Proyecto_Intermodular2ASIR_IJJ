# Introducción

### **Título del reto**
**Despliegue inicial de un sitio web corporativo para un taller de personalización y restauración de motocicletas**

---

### **Contexto de la empresa / organización**

El proyecto se plantea para un taller de reciente apertura situado en Crevillente, especializado en la restauración completa de motocicletas, fabricación de piezas personalizadas y mantenimiento general. Actualmente, el taller no cuenta con presencia digital, lo que dificulta que los potenciales clientes conozcan sus servicios, su ubicación y trabajos realizados. Debido a su reciente actividad, el taller busca mejorar su visibilidad y generar un canal de contacto accesible.

---

### **Problemática identificada**

Actualmente, el taller presenta las siguientes limitaciones:

- No dispone de página web ni medios digitales formales.
- No existe un repositorio público de sus trabajos para mostrar calidad y experiencia.
- La comunicación con el cliente se realiza únicamente a nivel presencial o mediante mensajería móvil.
- No hay un punto de referencia donde consultar ubicación, horarios o servicios.

Esta situación reduce su alcance comercial y limita la captación de nuevos clientes, especialmente aquellos que buscan referencias previas antes de contratar un servicio.

---

### **Objetivos del proyecto**

#### Objetivo general
Plantear el despliegue de una solución web alojada en un servidor propio que muestre información relevante del taller y sirva como base para futuras ampliaciones.

#### Objetivos específicos
- Definir la estructura base del sitio web y sus contenidos informativos.
- Proponer el uso de un servidor Ubuntu con servicios ejecutados mediante contenedores Docker.
- Documentar el proceso de implantación, configuraciones, decisiones y estructura del repositorio.
- Publicar la documentación del proyecto y avances en GitHub Pages.
- Sentar la base para futuras mejoras funcionales.

---

### **Identificación y clasificación de interesados**

| Interesado | Rol | Interés en el proyecto | Nivel de influencia |
|---|---|---|---|
| Propietario del taller | Cliente principal | Captar clientes y presentar trabajos realizados | Alto |
| Futuro cliente del taller | Usuario final | Consultar servicios y datos de contacto | Medio |
| Alumno desarrollador | Responsable del proyecto | Desarrollo y documentación técnica | Alto |
| Tutor del proyecto | Supervisor académico | Validar cumplimiento de objetivos | Alto |
| Centro educativo | Institución | Evaluación final del trabajo | Medio |

---

### **Mapa de interesados**

| Categoría | Interesados |
|---|---|
| Alta influencia – Alto interés | Propietario del taller, Alumno desarrollador, Tutor |
| Alta influencia – Bajo interés | Centro educativo |
| Baja influencia – Alto interés | Clientes futuros |
| Baja influencia – Bajo interés | Proveedores externos, otros talleres |

---

> La prioridad del proyecto se centra en el propietario del taller, en los requisitos académicos establecidos por el tutor y, de manera indirecta, en el futuro usuario final que consultará la web.

##  Requisitos del sistema

###  Requisitos funcionales (RF)

- **RF-001:** El sistema debe permitir la gestión de contenidos informativos mediante un CMS.
- **RF-002:** El sistema debe permitir la visualización estructurada de servicios y proyectos.
- **RF-003:** El sistema debe disponer de un panel básico de administración del contenido.

---

###  Requisitos no funcionales (RNF)

- **RNF-001:** El sistema debe garantizar un tiempo de carga adecuado para el acceso web.
- **RNF-002:** El sitio web debe ser accesible desde distintos dispositivos (diseño responsive).
- **RNF-003:** El sistema debe disponer de **copias de seguridad completas a nivel de servidor**, que permitan la recuperación ante fallos físicos o lógicos.
- **RNF-004:** El sistema debe garantizar comunicaciones seguras mediante el uso de **HTTPS**.

---

###  Requisitos de negocio (RN)

- **RN-001:** Mejorar la visibilidad online del taller y su presencia digital.

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
   Aplicación de medidas de seguridad, configuración de HTTPS, copias de seguridad y publicación de la documentación técnica.  
   Entregable: sistema validado y documentación final.

Los principales hitos del proyecto son:

- **Hito 1:** servidor configurado con servicios funcionales.
- **Hito 2:** sistema seguro, documentado y listo para entrega.

---

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

---

### 1.2 Alcance técnico

El proyecto se basa en tecnologías de **código abierto**, alineadas con los contenidos del ciclo formativo de **Administración de Sistemas Informáticos en Red (ASIR)** y ampliamente utilizadas en entornos profesionales.

Las tecnologías y plataformas seleccionadas son:
- **Sistema operativo:** Ubuntu Server  
- **Plataforma de virtualización/contenedores:** Docker  
- **Servidor web:** Apache  
- **CMS:** WordPress  
- **Sistema gestor de bases de datos:** MySQL  
- **Control de versiones:** Git y GitHub  
- **Documentación técnica:** GitHub Pages  

#### Justificación de la plataforma de virtualización

Se ha seleccionado Docker como entorno de virtualización por los siguientes motivos:

- Permite el aislamiento de servicios mediante contenedores independientes.
- Facilita la instalación, mantenimiento y replicabilidad del entorno.
- Reduce el impacto de fallos en el sistema base.
- Optimiza el uso de recursos frente a máquinas virtuales tradicionales.
- Se ajusta al alcance académico del proyecto y a los objetivos del módulo ASIR.

---

#### Presupuesto estimado

El proyecto se desarrolla utilizando software libre y servicios gratuitos, no obstante puede estar sujeto a pagos necesarios ( validación de certificados, dominio, Sobrecostes por IP PÚBLICA):

- Ubuntu Server, Docker, Apache, MySQL y WordPress.
- GitHub y GitHub Pages para control de versiones y documentación.

El coste económico del proyecto es **nulo**, limitándose al uso del equipo personal del alumno y conexión a internet.
El coste de un despliegue real simultaneo a el proyecto, si que conllevaria los costes adicionales mencionados anteriormente.

---

## 2. Especificación de requisitos por módulos

### 2.1 ASGBD – Administración de Sistemas Gestores de Bases de Datos
- Instalación y configuración del sistema gestor de bases de datos MySQL.
- Creación y gestión de la estructura de base de datos utilizada por WordPress.
- Configuración de usuarios y sus respectivos permisos.
- Inclusión de la base de datos en las copias de seguridad del servidor.

---

### 2.2 ASO – Administración de Sistemas Operativos
- Instalación y configuración de Ubuntu Server en entorno Docker.
- Gestión de usuarios, permisos y políticas básicas de seguridad.
- Configuración y control de servicios del sistema (Apache y MySQL).
- Implementación de copias de seguridad completas del entorno.
- Conexión entre WordPress y la base de datos MySQL.
- Aislamiento de servicios mediante redes Docker personalizadas.

---

### 2.3 IAW – Implantación de Aplicaciones Web
- Instalación y configuración del servidor web Apache.
- Instalación y configuración de WordPress.
- Administración de usuarios del CMS.
- Personalización básica de la aplicación web.

---

### 2.4 Servicios de Red e Internet
- Configuración de acceso remoto seguro mediante SSH.
- Configuración de DNS básico o uso de DNS externo.
- Publicación del servicio web mediante Apache.
- Implementación de certificados SSL mediante **Let’s Encrypt**.

---

### 2.5 Seguridad y Alta Disponibilidad
- Configuración de firewall básico mediante ufw o reglas de red Docker.
- Implementación de certificados SSL mediante **Let’s Encrypt**.
- Configuración de Apache para forzar el uso de HTTPS.
- Análisis básico de amenazas y aplicación de medidas de protección.
- Protección frente a pérdida de datos mediante copias de seguridad a nivel de servidor.
