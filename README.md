# 📱 SafeInspect Mobile

## ¿Qué es SafeInspect Mobile?

SafeInspect Mobile es una aplicación móvil multiplataforma desarrollada con **Flutter** y orientada al registro y seguimiento de inspecciones de seguridad industrial.

La aplicación busca facilitar el trabajo del personal encargado de realizar inspecciones en campo, permitiendo registrar información de manera organizada, gestionar hallazgos y conservar evidencias fotográficas desde un dispositivo móvil.

## 🎯 Situación problema

En empresas del sector industrial, las inspecciones de seguridad pueden realizarse mediante formatos físicos, hojas de cálculo o aplicaciones de mensajería para compartir evidencias. Este proceso puede generar pérdida de información, duplicidad de registros, retrasos en los reportes y dificultades para hacer seguimiento a los hallazgos.

La situación se vuelve más compleja cuando las inspecciones se realizan en lugares con **baja o nula conectividad a Internet**, donde depender permanentemente de una conexión puede impedir o retrasar el registro de la información.

## 💡 ¿Cómo soluciona SafeInspect el problema del papel y la falta de Internet?

SafeInspect Mobile digitaliza el proceso de inspección mediante una aplicación móvil, reemplazando progresivamente los formatos físicos y centralizando la información de las inspecciones.

La solución contempla un enfoque **Offline-First**, de manera que la aplicación pueda conservar la información registrada durante el trabajo en campo cuando no exista conexión. Posteriormente, cuando el dispositivo recupere la conectividad, la información podrá sincronizarse con los servicios de Firebase.

De esta forma, el flujo previsto es:

```text
Inspector
   │
   ▼
SafeInspect Mobile
   │
   ├── Registrar inspección
   ├── Registrar hallazgos
   ├── Capturar evidencias
   └── Guardar información localmente
             │
             ▼
       ¿Hay conexión?
          /       \
        No         Sí
        │           │
        ▼           ▼
   Datos locales  Firebase
        │           │
        └─────┬─────┘
              ▼
       Sincronización
```

> **Nota:** en esta Entrega 1 se presenta la estructura inicial de la aplicación. La estrategia Offline-First y la sincronización con Firebase serán implementadas progresivamente durante las siguientes iteraciones del proyecto.

## ❓ Pregunta problema

**¿De qué manera la implementación de una aplicación móvil desarrollada con Flutter e integrada con Firebase permite mejorar el registro, almacenamiento y seguimiento de inspecciones de seguridad industrial en escenarios con baja o nula conectividad?**

## 🎯 Objetivo general

Desarrollar una aplicación móvil para Android utilizando Flutter e integrada con Firebase que permita registrar y gestionar inspecciones de seguridad industrial, reduciendo el tiempo de registro de información en campo y mejorando la trazabilidad de los hallazgos.

## ☁️ ¿Qué servicios de Firebase utiliza SafeInspect Mobile?

### 🔐 Firebase Authentication

Se utilizará para gestionar la autenticación de los usuarios y controlar el acceso a las funcionalidades de la aplicación.

### 🗄️ Cloud Firestore

Se utilizará como base de datos en la nube para almacenar la información estructurada de las inspecciones, registros y hallazgos.

### 📸 Firebase Storage

Se utilizará para almacenar las evidencias fotográficas asociadas a las inspecciones y hallazgos.

### 🔄 Sincronización con la nube

Firebase será el componente cloud de la solución. La aplicación mantendrá una estrategia de almacenamiento local para el trabajo sin conexión y realizará la sincronización con Firebase cuando exista conectividad disponible.

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

La aplicación cuenta con una pantalla inicial y un flujo básico para iniciar una nueva inspección. El formulario permite registrar nombre, ubicación y hallazgo, además de dejar preparado el punto de integración para evidencias fotográficas.

La capa de servicios contiene el punto de integración para **Firebase Authentication, Cloud Firestore y Firebase Storage**. La implementación completa de la conexión con Firebase, la estrategia Offline-First y la sincronización se desarrollará progresivamente.

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
