# Marco Tecnológico

## 1. Diseño Conceptual

El diseño conceptual describe la **infraestructura y organización de servicios** del proyecto, mostrando cómo se interconectan los distintos elementos del sistema, cómo se gestiona la persistencia de datos y cómo se asegura la comunicación segura y el aislamiento entre servicios.

### 1.1 Visión general de la infraestructura

El sistema se implementa sobre un **host Ubuntu Server**, que actúa como base para todos los servicios:

![Mapa conceptual de la infraestructura del sistema](images/EsquemaRed.png)

*Figura 1. Mapa conceptual que representa la infraestructura tecnológica del sistema, mostrando la relación entre el servidor, los servicios Docker y las redes internas.*

### 1.2 Host y firewall perimetral

- **Ubuntu Server (host)**  
  - Sistema operativo base para la gestión de usuarios, permisos y servicios del servidor.  
  - Configuración de firewall mediante **nftables** para controlar el tráfico entrante y saliente del host y proteger los servicios desplegados.

- **Firewall nftables en Ubuntu Server**  
  - Controla y filtra el tráfico entrante y saliente del host.  
  - Permite únicamente conexiones autorizadas hacia Apache (HTTP/HTTPS) y SSH hacia el host.  

### 1.3 Plataforma Docker y diseño de contenedores

- **Docker Engine**  
  - Motor de contenedores que permite ejecutar los servicios de forma aislada.  
  - Gestiona la creación de contenedores, redes internas y volúmenes persistentes.  
  - Garantiza portabilidad, escalabilidad y facilidad de mantenimiento del entorno.

- **Red interna Docker**  
  - Red privada que permite la comunicación entre contenedores sin exponer la base de datos directamente a la red externa.  
  - Garantiza aislamiento y seguridad de los servicios.

- **Volúmenes Docker**  
  - Permiten la persistencia de datos importantes (MySQL y WordPress) frente a reinicios o recreaciones de contenedores.  
  - Facilitan la realización de copias de seguridad completas del entorno.

<p align="center">
  <img src="images/docker.png" alt="Esquema de los contenedores y volúmenes Docker">
</p>

### 1.4 Servicios en contenedores: WordPress y MySQL

- **Contenedores principales**

  - **Contenedor WordPress + Apache**
    - Servidor web Apache que gestiona el CMS WordPress.  
    - Almacena archivos de WordPress y configuraciones en un **volumen Docker persistente**.  
    - Conectado a MySQL a través de la **red interna Docker** para comunicaciones seguras y aisladas.  
    - Configurado para acceso seguro mediante **HTTPS** con certificados Let’s Encrypt.


     ![Vista de la página WordPress](images/wordpress1.png)

    *Figura 2. Ejemplo de la página principal del sitio WordPress desplegado en el proyecto.*


    **Contenedor MySQL**
    - Base de datos relacional que almacena la información de WordPress (usuarios, contenidos, configuraciones).  
    - Utiliza un **volumen Docker persistente** para asegurar la disponibilidad y recuperación de datos.
    ![Mapa_mysql](images/mysql.png)

    *Figura 3. Ejemplo de un posible diseño muy sencillo de la base de datos*
    

### 1.5 Datos y vistas de la aplicación

#### Vehículos registrados

| MATRÍCULA | MODELO     | CLIENTE     | TELÉFONO     |
|-----------|-----------|-----------|-----------|
| 1234ABC   | Yamaha R6  | Juan Pérez  | 600123123    |
| 5678DEF   | Honda CBR  | Ana López   | 611222333    |

#### Servicios realizados

| FECHA       | MATRÍCULA | DESCRIPCIÓN        |
|-----------|-----------|-----------|
| 2025-01-10  | 1234ABC   | Cambio de aceite   |
| 2025-03-02  | 1234ABC   | Ajuste frenos     |

*Figura 4. Ejemplo de las vistas disponibles en función de la base de datos propuesta anteriormente.*

### 1.6 Flujo de datos

1. El usuario accede al sitio web mediante navegador web.  
2. La solicitud llega al contenedor **WordPress + Apache**, que procesa la petición y genera la respuesta.  
3. WordPress consulta o actualiza datos en el contenedor **MySQL** a través de la red interna Docker.  
4. Los datos son devueltos al contenedor de Apache y presentados al usuario mediante HTTPS.  
5. Los volúmenes Docker aseguran que toda la información crítica se almacene de forma persistente, permitiendo recuperación en caso de fallos.

### 1.7 Seguridad y aislamiento

- **Red interna Docker**  
  - Aísla el tráfico de los contenedores y evita accesos no autorizados a la base de datos.  

- **HTTPS con Let’s Encrypt**  
  - Garantiza cifrado de extremo a extremo de las comunicaciones web.  
  - Configuración dentro del contenedor de Apache para forzar el uso de HTTPS.  

- **Volúmenes persistentes**  
  - Protegen los datos frente a reinicios de contenedores o fallos del sistema.

### 1.8 Justificación del diseño

- Separación de servicios en contenedores para **aislamiento, seguridad y facilidad de mantenimiento**.  
- Uso de **volúmenes persistentes** para asegurar la recuperación de datos en caso de fallos.  
- **nftables** como firewall del host permite un control granular del tráfico de red y mejora la seguridad general.  
- La **red interna Docker** asegura que la comunicación entre WordPress y MySQL sea segura y privada.  
- Apache con HTTPS garantiza acceso seguro al CMS.  
- Este diseño conceptual es **reproducible, escalable y alineado con los objetivos de ASIR**, listo para la fase de implementación.

---

### 1.9 Matriz de vulnerabilidades

La siguiente matriz recoge las principales vulnerabilidades asociadas a la infraestructura descrita, así como su impacto, probabilidad estimada y las medidas de mitigación previstas.

| Activo / Componente              | Vulnerabilidad / Amenaza                                                 | Impacto | Probabilidad | Nivel de riesgo | Medidas de mitigación principales                                                                 |
|----------------------------------|---------------------------------------------------------------------------|---------|-------------|-----------------|----------------------------------------------------------------------------------------------------|
| Ubuntu Server (host)            | Sistema desactualizado (faltan parches de seguridad)                     | Alto    | Media       | Alto            | Plan de actualización periódica del sistema, uso de repositorios oficiales y revisión de avisos.  |
| Ubuntu Server + nftables        | Reglas de firewall mal configuradas (puertos innecesarios abiertos)     | Alto    | Media       | Alto            | Definición de políticas restrictivas en **nftables**, revisión de reglas y pruebas de conectividad.|
| Acceso SSH al host              | Uso de credenciales débiles o fuga de contraseña                         | Alto    | Media       | Alto            | Autenticación robusta, restricción de acceso SSH, uso de claves y cambio periódico de credenciales.|
| Docker Engine                   | Exposición accidental de contenedores a la red pública                  | Alto    | Baja        | Medio           | Uso de **red interna Docker** para servicios internos y revisión de puertos publicados en Docker. |
| Contenedor WordPress + Apache   | Vulnerabilidades en WordPress o plugins desactualizados                 | Alto    | Media       | Alto            | Actualización periódica de WordPress y plugins, uso de plugins confiables y copias de seguridad.  |
| Contenedor WordPress + Apache   | Ataques de fuerza bruta sobre el panel de acceso                        | Medio   | Media       | Medio           | Limitación de intentos de login, uso de contraseñas fuertes y, en su caso, plugins de seguridad.  |
| Contenedor MySQL                | Acceso no autorizado a la base de datos                                  | Alto    | Baja        | Medio           | Restricción de acceso a través de la **red interna Docker**, gestión de usuarios y permisos.      |
| Contenedor MySQL                | Pérdida o corrupción de datos                                            | Alto    | Baja        | Medio           | Uso de **volúmenes Docker persistentes** y realización de copias de seguridad periódicas.         |
| Volúmenes Docker (WordPress/DB) | Acceso no controlado a datos almacenados en volúmenes                   | Alto    | Baja        | Medio           | Control de permisos sobre los volúmenes y almacenamiento seguro de las copias de seguridad.       |
| HTTPS (Let’s Encrypt)           | Caducidad de certificados o fallo en la renovación automática            | Medio   | Media       | Medio           | Monitorización del estado de los certificados y verificación de la renovación con Let’s Encrypt.  |
| Red interna Docker              | Configuración incorrecta que permita acceso externo a servicios internos | Alto    | Baja        | Medio           | Verificación de que los servicios críticos solo son accesibles por la **red interna Docker**.     |
