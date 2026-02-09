# Marco Tecnológico

## 1. Diseño Conceptual

El diseño conceptual describe la **infraestructura y organización de servicios** del proyecto, mostrando cómo se interconectan los distintos elementos del sistema, cómo se gestiona la persistencia de datos y cómo se asegura la comunicación segura y el aislamiento entre servicios.

### 1.1 Infraestructura del sistema

El sistema se implementa sobre un **host Ubuntu Server**, que actúa como base para todos los servicios:

- **Ubuntu Server (host)**  
  - Sistema operativo base para la gestión de usuarios, permisos y servicios del servidor.  
  - Configuración de firewall mediante **nftables** para controlar el tráfico entrante y saliente del host y proteger los servicios desplegados.

  ![Mapa1](images/mapa_conceptual.png)

- **Docker Engine**  
  - Motor de contenedores que permite ejecutar los servicios de forma aislada.  
  - Gestiona la creación de contenedores, redes internas y volúmenes persistentes.  
  - Garantiza portabilidad, escalabilidad y facilidad de mantenimiento del entorno.

- **Contenedores principales**
  - **Contenedor MySQL**
    - Base de datos relacional que almacena la información de WordPress (usuarios, contenidos, configuraciones).  
    - Utiliza un **volumen Docker persistente** para asegurar la disponibilidad y recuperación de datos.
    ![Mapa_mysql](images/mysql.png)

### Vehículos registrados

| MATRÍCULA | MODELO     | CLIENTE     | TELÉFONO     |
|-----------|-----------|-----------|-----------|
| 1234ABC   | Yamaha R6  | Juan Pérez  | 600123123    |
| 5678DEF   | Honda CBR  | Ana López   | 611222333    |

### Servicios realizados

| FECHA       | MATRÍCULA | DESCRIPCIÓN        |
|-----------|-----------|-----------|
| 2025-01-10  | 1234ABC   | Cambio de aceite   |
| 2025-03-02  | 1234ABC   | Ajuste frenos     |

  - **Contenedor WordPress + Apache**
    - Servidor web Apache que gestiona el CMS WordPress.  
    - Almacena archivos de WordPress y configuraciones en un **volumen Docker persistente**.  
    - Conectado a MySQL a través de la **red interna Docker** para comunicaciones seguras y aisladas.  
    - Configurado para acceso seguro mediante **HTTPS** con certificados Let’s Encrypt.

- **Red interna Docker**
  - Red privada que permite la comunicación entre contenedores sin exponer la base de datos directamente a la red externa.  
  - Garantiza aislamiento y seguridad de los servicios.

- **Volúmenes Docker**
  - Permiten la persistencia de datos importantes (MySQL y WordPress) frente a reinicios o recreaciones de contenedores.  
  - Facilitan la realización de copias de seguridad completas del entorno.

  ![Mapa_docker](images/docker.png)

### 1.2 Flujo de datos

1. El usuario accede al sitio web mediante navegador web.  
2. La solicitud llega al contenedor **WordPress + Apache**, que procesa la petición y genera la respuesta.  
3. WordPress consulta o actualiza datos en el contenedor **MySQL** a través de la red interna Docker.  
4. Los datos son devueltos al contenedor de Apache y presentados al usuario mediante HTTPS.  
5. Los volúmenes Docker aseguran que toda la información crítica se almacene de forma persistente, permitiendo recuperación en caso de fallos.

### 1.3 Seguridad y aislamiento

- **Firewall nftables** en Ubuntu Server:
  - Controla y filtra el tráfico entrante y saliente del host.  
  - Permite únicamente conexiones autorizadas hacia Apache (HTTP/HTTPS) y SSH hacia el host.  

- **Red interna Docker**
  - Aísla el tráfico de los contenedores y evita accesos no autorizados a la base de datos.  

- **HTTPS con Let’s Encrypt**
  - Garantiza cifrado de extremo a extremo de las comunicaciones web.  
  - Configuración dentro del contenedor de Apache para forzar el uso de HTTPS.  

- **Volúmenes persistentes**
  - Protegen los datos frente a reinicios de contenedores o fallos del sistema.

### 1.4 Justificación del diseño

- Separación de servicios en contenedores para **aislamiento, seguridad y facilidad de mantenimiento**.  
- Uso de **volúmenes persistentes** para asegurar la recuperación de datos en caso de fallos.  
- **nftables** como firewall del host permite un control granular del tráfico de red y mejora la seguridad general.  
- La **red interna Docker** asegura que la comunicación entre WordPress y MySQL sea segura y privada.  
- Apache con HTTPS garantiza acceso seguro al CMS.  
- Este diseño conceptual es **reproducible, escalable y alineado con los objetivos de ASIR**, listo para la fase de implementación.

---