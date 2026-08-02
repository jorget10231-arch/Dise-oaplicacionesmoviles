# 📱 SafeInspect Mobile

Aplicación móvil desarrollada con **Flutter** y **Firebase** para optimizar el registro y seguimiento de inspecciones de seguridad industrial mediante una plataforma segura, intuitiva y conectada a la nube.

---

# Descripción del Proyecto

Actualmente, muchas empresas realizan las inspecciones de seguridad utilizando formatos físicos, hojas de cálculo o aplicaciones de mensajería para compartir evidencias. Este proceso ocasiona pérdida de información, duplicidad de registros y retrasos en la generación de reportes.

SafeInspect Mobile propone una solución tecnológica que permite registrar inspecciones desde dispositivos móviles, almacenar evidencias fotográficas y sincronizar la información con la nube de forma segura.

---

# Objetivo General

Desarrollar una aplicación móvil para Android utilizando Flutter e integrada con Firebase que permita registrar y gestionar inspecciones de seguridad industrial, reduciendo el tiempo de registro de información y mejorando la trazabilidad de los hallazgos.

---

# Tecnologías Utilizadas

- Flutter
- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- Git
- GitHub
- Figma

---

# Arquitectura

```text
                 Usuario

                    │

          Aplicación Flutter

                    │

                 HTTPS

                    │

      Firebase Authentication

                    │

            Cloud Firestore

                    │

          Firebase Storage

                    │

          Evidencias Fotográficas
```

---

# Funcionalidades

- Inicio de sesión seguro.
- Registro de inspecciones.
- Captura de fotografías.
- Consulta del historial.
- Sincronización con Firebase.
- Gestión de hallazgos.
- Almacenamiento seguro.

---

# Estructura del Proyecto

```
SafeInspect-Mobile/

│

├── app/

│

├── docs/

│   ├── arquitectura/

│   ├── evidencias/

│   ├── presentacion/

│

├── README.md

├── LICENSE

└── .gitignore
```

---

# Seguridad

La aplicación implementa las siguientes medidas de seguridad:

- Autenticación mediante Firebase Authentication.
- Comunicación segura mediante HTTPS.
- Tokens JWT para autenticación.
- Almacenamiento seguro de información sensible.
- Reglas de acceso en Firestore y Firebase Storage.

---

# Estado del Proyecto

🚧 En desarrollo

---

# Autor

**Jorge Ignacio Torres Parra**

Ingeniería Informática

Fundación Universitaria Católica del Norte

2026

---

# Licencia

Proyecto desarrollado con fines académicos.
