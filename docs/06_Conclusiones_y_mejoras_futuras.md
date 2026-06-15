# Conclusiones y Mejoras Futuras

## 1. Conclusiones

### 1.1 Valoración técnica

El proyecto ha cumplido todos los objetivos de planificación. Se ha desplegado una infraestructura cloud completa — tres instancias EC2, contenedores Docker, DNS propio, HTTPS y backups automáticos — sobre la que funcionan las aplicaciones web del taller.

La arquitectura resultante es modular, reproducible y alineada con entornos de producción reales. El detalle de evidencias se recoge en el capítulo **Resultados**.

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