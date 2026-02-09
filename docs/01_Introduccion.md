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
