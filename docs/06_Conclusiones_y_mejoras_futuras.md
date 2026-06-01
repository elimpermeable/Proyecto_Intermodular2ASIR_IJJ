# Conclusiones y Mejoras Futuras

## 1. Conclusiones

### 1.1 Valoración técnica

El proyecto ha permitido desplegar una infraestructura completa, funcional y segura que cubre todas las necesidades digitales de un taller real. Se ha pasado de una situación inicial sin ninguna presencia digital a disponer de:

- Una **web pública** accesible desde cualquier dispositivo del mundo con dominio propio y HTTPS.
- Un **panel de administración privado** para la gestión interna del taller, accesible únicamente desde equipos autorizados mediante DNS privado.
- Un **servidor DNS propio** capaz de resolver los dominios del taller de forma independiente a proveedores externos.
- Un **sistema de copias de seguridad automáticas** nocturnas en servidor independiente, garantizando la continuidad del negocio ante cualquier fallo.

Todos los objetivos definidos en la fase de planificación han sido cumplidos. La arquitectura resultante es modular, reproducible y alineada con entornos de producción reales.

---

### 1.2 Competencias adquiridas

El desarrollo del proyecto ha permitido poner en práctica de forma integrada conocimientos de múltiples módulos del ciclo formativo:

- **Administración de sistemas** — despliegue y gestión de Ubuntu Server 24.04 en la nube.
- **Contenedores** — orquestación de servicios con Docker Compose v2, gestión de redes y volúmenes persistentes.
- **Bases de datos** — diseño relacional, usuarios con privilegios mínimos e integración con aplicaciones.
- **Servicios de red** — configuración de un servidor DNS con BIND9 y zonas propias.
- **Seguridad** — implementación de HTTPS, Security Groups y aislamiento de servicios.
- **Alta disponibilidad** — copias de seguridad automáticas con rsync y cron en servidor independiente.
- **Infraestructura cloud** — gestión de instancias EC2, Elastic IPs y Security Groups en AWS.

---

### 1.3 Valoración del equipo

El trabajo en equipo ha sido fundamental para integrar los distintos componentes del sistema. La separación de roles entre infraestructura, base de datos y aplicación ha permitido trabajar en paralelo manteniendo la coherencia del proyecto.

---

## 2. Mejoras Futuras

La infraestructura actual es completamente funcional. Sin embargo, existen líneas de evolución que llevarían el sistema a un nivel profesional superior.

---

### 2.1 Infraestructura como Código con Terraform

Actualmente toda la infraestructura AWS se ha creado manualmente desde la consola web. Con **Terraform** se describiría toda la infraestructura en archivos de texto versionados en Git, de forma que con un solo comando se recrearían las tres instancias, sus Elastic IPs y los Security Groups en cualquier cuenta AWS en cuestión de minutos. Esto elimina el riesgo de error humano y convierte el despliegue en un proceso completamente automatizado y repetible.

---

### 2.2 Alta disponibilidad

La infraestructura actual depende de una única instancia principal. Una mejora significativa sería añadir un **balanceador de carga** que distribuyera el tráfico entre dos instancias, garantizando que el servicio siga disponible aunque una de ellas fallara.

---

### 2.3 Monitorización y alertas

Actualmente no existe monitorización activa. Con herramientas como **Grafana + Prometheus** se podría visualizar en tiempo real el estado de los contenedores y recibir alertas automáticas si algún servicio cae o supera umbrales críticos.

---

### 2.4 Dominio propio

Actualmente el dominio depende de un tercero. Para un entorno de producción real sería recomendable registrar un dominio propio como `fhdproyects.com`, lo que proporcionaría independencia total y una imagen más profesional de cara al cliente.