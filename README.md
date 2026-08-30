# 📱 SafeInspect Mobile

Aplicación móvil multiplataforma desarrollada con **Flutter** y preparada para integrarse con **Firebase** para optimizar el registro y seguimiento de inspecciones de seguridad industrial.

## 🎯 Situación problema

En empresas del sector industrial, las inspecciones de seguridad pueden realizarse mediante formatos físicos, hojas de cálculo o aplicaciones de mensajería para compartir evidencias. Esto puede generar pérdida de información, duplicidad de registros, retrasos en reportes y dificultades para hacer seguimiento a los hallazgos. El problema se incrementa en zonas con baja o nula conectividad.

SafeInspect Mobile propone registrar inspecciones desde dispositivos móviles, conservar la información durante la operación en campo y sincronizarla de forma segura con servicios en la nube cuando exista conexión.

## ❓ Pregunta problema

**¿De qué manera la implementación de una aplicación móvil desarrollada con Flutter e integrada con Firebase permite mejorar el registro, almacenamiento y seguimiento de inspecciones de seguridad industrial en escenarios con baja o nula conectividad?**

## 🎯 Objetivo general

Desarrollar una aplicación móvil para Android utilizando Flutter e integrada con Firebase que permita registrar y gestionar inspecciones de seguridad industrial, reduciendo el tiempo de registro de información en campo y mejorando la trazabilidad de los hallazgos.

## 🧩 Metodología

**Mobile Agile / Scrum**, con sprints semanales, prototipado UX/UI y validación progresiva en dispositivos reales.

## 🛠️ Tecnologías

- Flutter / Dart
- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- Git / GitHub
- Figma

## 📁 Estructura actual

```text
Dise-oaplicacionesmoviles/
├── app/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── models/
│   │   │   └── inspection.dart
│   │   ├── screens/
│   │   │   └── inspection_form_page.dart
│   │   └── services/
│   │       └── firebase_service.dart
│   ├── test/
│   │   └── widget_test.dart
│   ├── pubspec.yaml
│   └── analysis_options.yaml
├── docs/
├── presentation/
└── README.md
```

## 📱 Estado de la aplicación

**Entrega 1 — estructura inicial en desarrollo.**

La aplicación ya cuenta con una pantalla inicial y un flujo básico para iniciar una nueva inspección. El formulario permite registrar nombre, ubicación y hallazgo, además de dejar preparado el punto de integración para evidencias fotográficas.

La capa de servicios incluye el punto de integración para **Firebase Authentication, Cloud Firestore y Firebase Storage**. La estrategia Offline-First y la sincronización serán implementadas progresivamente en las siguientes iteraciones.

## ☁️ Arquitectura prevista

```text
Usuario
   │
   ▼
Aplicación Flutter
   │
   ├── UI / Screens
   ├── Models
   ├── Services
   └── Persistencia local / Offline-First
             │
             ▼
          Firebase
       ├── Authentication
       ├── Firestore
       └── Storage
```

## 🔐 Seguridad

La arquitectura contempla autenticación mediante Firebase Authentication, comunicación HTTPS/TLS, control de acceso mediante reglas de seguridad de Firestore y Storage y almacenamiento seguro de información sensible en el dispositivo.

## ▶️ Ejecución

Desde la carpeta `app/`, con Flutter instalado:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

> La configuración real de Firebase se completará mediante FlutterFire. No se deben publicar claves privadas, credenciales ni archivos sensibles en el repositorio.

## 👤 Autor

**Jorge Ignacio Torres Parra**  
Ingeniería Informática — Fundación Universitaria Católica del Norte  
2026

## 📄 Propósito

Proyecto desarrollado con fines académicos para el Taller ABP — Diseño de Aplicaciones Móviles.
