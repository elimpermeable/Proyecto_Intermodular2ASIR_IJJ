# Marco Tecnológico

## Alcance funcional

### Qué se incluye
- Página web informativa con detalles de servicios y proyectos realizados.
- Galería de imágenes de restauraciones y motos personalizadas.
- Información de contacto y ubicación del taller.
- Documentación técnica del proyecto publicada en GitHub Pages.
- Panel básico de administración para futuras ampliaciones.

### Qué se excluye
- E-commerce o sistema de venta online.
- Gestión avanzada de inventario o pedidos.
- Panel de administración completo con roles múltiples en esta fase.
- Integración con sistemas ERP o pasarelas de pago.

---

## Alcance técnico

### Tecnologías y plataformas propuestas
- **Sistema operativo:** Ubuntu Server
- **Virtualización/Contenedores:** Docker
- **Servidor web:** Nginx
- **CMS:** WordPress (instalación y personalización básica)
- **Base de datos:** Por definir
- **Control de versiones:** Git y GitHub
- **Documentación pública:** GitHub Pages
- **Scripting:** Posibilidad de añadir automatizaciones

### Justificación y decisión de la plataforma de virtualización
Se ha optado por **Docker** por las siguientes razones:  
- Permite desplegar servicios aislados y reproducibles.  
- Facilita la instalación y configuración de Nginx, WordPress y base de datos sin interferencias con el sistema base.  
- Reduce complejidad respecto a soluciones como GNS3 o AWS, adecuándose al alcance inicial del proyecto.  
- Garantiza portabilidad y fácil mantenimiento futuro.

---

## Alcance temporal

### Fases
1. **Planificación y caracterización del reto**  
   - Documentación inicial: RA1.1, RA1.2, RA1.3 y RA1.4  
   - Entregable: Introducción y análisis del contexto

2. **Implementación del entorno técnico**  
   - Configuración de servidor Ubuntu con contenedores Docker  
   - Instalación de Nginx, WordPress y base de datos  
   - Entregable: Repositorio funcional y entorno Docker operativo

3. **Publicación y documentación**  
   - Configuración de GitHub Pages con MkDocs  
   - Documentación completa de requisitos, alcance y estructura  
   - Entregable: Página web pública y documentación técnica

### Hitos y entregables
- **Hito 1:** Repositorio configurado con Docker y servicios iniciales.  
- **Hito 2:** Publicación en GitHub Pages y entrega final de documentación.

---

## Alcance de recursos

### Equipo y roles
- **Alumnos desarrolladores:** Responsables de la planificación, implementación y documentación del proyecto.
- **Tutor del proyecto:** Supervisión y validación de los entregables.

### Presupuesto estimado
- Uso de software libre y plataformas gratuitas: Docker, Ubuntu, WordPress, GitHub Pages.  
- Coste de hardware mínimo: ordenador del alumno y conexión a internet.  
- Presupuesto aproximado: 0 € (sin licencias de pago ni infraestructura adicional).

---

## Requisitos

### Requisitos funcionales (RF)
- **RF-001:** Sistema de gestión de productos/catálogo  
- **RF-002:** Búsqueda y filtrado de productos  
- **RF-003:** Panel de administración por empresa

### Requisitos no funcionales (RNF)
- **RNF-001:** Tiempo de carga < 2 segundos  
- **RNF-002:** Diseño responsive  
- **RNF-003:** Backup diario automático

### Requisitos de negocio (RN)
- **RN-001:** Mejorar visibilidad online del sector  
- **RN-002:** Cumplimiento RGPD/LOPD

---

## Matriz de trazabilidad de requisitos

| ID | Descripción | Tipo | ASGBD | ASO | IAW | Serv. Red | Seguridad | Estado |
|---|---|---|:---:|:---:|:---:|:---:|:---:|---|
| RF-001 | Sistema de gestión de productos/catálogo | Funcional | ✓ | - | ✓ | - | - | Planificado |
| RF-002 | Búsqueda y filtrado de productos | Funcional | ✓ | - | ✓ | - | - | Planificado |
| RF-003 | Panel de administración por empresa | Funcional | ✓ | ✓ | ✓ | - | ✓ | Planificado |
| RNF-001 | Tiempo de carga < 2 segundos | No funcional | - | ✓ | ✓ | ✓ | - | Planificado |
| RNF-002 | Diseño responsive | No funcional | - | - | ✓ | - | - | Planificado |
| RNF-003 | Backup diario automático | No funcional | ✓ | ✓ | - | - | ✓ | Planificado |
| RN-001 | Mejorar visibilidad online del sector | Negocio | - | - | ✓ | ✓ | - | Planificado |
| RN-002 | Cumplimiento RGPD/LOPD | Negocio | ✓ | ✓ | - | - | ✓ | Planificado |
