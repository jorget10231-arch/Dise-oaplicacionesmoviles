# 📱 SafeInspect Mobile

Aplicación móvil multiplataforma para el registro y seguimiento de inspecciones de seguridad industrial.

> **Taller ABP — Entrega 1: Proyecto, Presentación y Repositorio en GitHub**

## 1. Situación problema

En escenarios de inspección de seguridad industrial, el registro mediante formatos físicos, hojas de cálculo o herramientas de mensajería puede generar pérdida de información, duplicidad de registros, retrasos y dificultades para hacer seguimiento a los hallazgos y sus evidencias.

El problema se vuelve más crítico en recorridos de campo con conectividad limitada o intermitente. Por esta razón, SafeInspect Mobile se plantea como una aplicación móvil con una estrategia **Offline-First**, capaz de conservar información localmente y preparar su sincronización con servicios cloud cuando exista conectividad.

### Pregunta problema

**¿De qué manera la implementación de una aplicación móvil desarrollada con Flutter e integrada con Firebase permite mejorar el registro, almacenamiento y seguimiento de inspecciones de seguridad industrial en escenarios con baja o nula conectividad?**

## 2. Objetivo general

Desarrollar una aplicación móvil para Android utilizando Flutter e integrada con Firebase que permita registrar y gestionar inspecciones de seguridad industrial, reduciendo el tiempo de registro de información en campo y mejorando la trazabilidad de los hallazgos.

## 3. Propuesta tecnológica

| Tecnología | Responsabilidad |
|---|---|
| **Flutter / Dart** | Aplicación móvil y arquitectura multiplataforma |
| **Firebase Authentication** | Autenticación y control de acceso |
| **Cloud Firestore** | Persistencia de información estructurada en la nube |
| **Firebase Storage** | Almacenamiento de evidencias multimedia |
| **Persistencia local** | Operación durante periodos sin conectividad |
| **Git / GitHub** | Control de versiones, trazabilidad y entrega |

La selección tecnológica responde al contexto del problema: una aplicación móvil facilita el registro en campo; Flutter permite mantener una base de código multiplataforma; Firebase proporciona servicios administrados para autenticación, datos y almacenamiento; y el enfoque Offline-First reduce la dependencia de una conexión permanente.

## 4. Arquitectura

```text
┌───────────────────────────────────────┐
│             PRESENTACIÓN              │
│ Login · Home · Inspecciones · Historial│
└───────────────────┬───────────────────┘
                    │
┌───────────────────▼───────────────────┐
│               SERVICIOS               │
│ Auth · Firestore · Storage · Sync     │
└───────────────────┬───────────────────┘
                    │
┌───────────────────▼───────────────────┐
│             REPOSITORIOS              │
│ Inspecciones · Hallazgos · Evidencias │
└───────────────────┬───────────────────┘
                    │
┌───────────────────▼───────────────────┐
│          PERSISTENCIA LOCAL           │
│          Estrategia Offline-First     │
└───────────────────┬───────────────────┘
                    │
                    ▼
             ┌──────────────┐
             │   FIREBASE   │
             │ Auth          │
             │ Firestore     │
             │ Storage       │
             └──────────────┘
```

La estructura del código separa pantallas, modelos, repositorios y servicios para reducir acoplamiento y facilitar la evolución del producto.

## 5. Flujo funcional

```text
Inicio de sesión
       ↓
Panel de inspecciones
       ↓
Nueva inspección
       ↓
Registro de información
       ↓
Persistencia local
       ↓
¿Existe conectividad?
    ↙           ↘
  No             Sí
  ↓               ↓
Local        Sincronización
  └───────┬───────┘
          ↓
        Firebase
```

## 6. Estado de implementación

### Validado

- Flutter configurado para Android.
- Emulador Android operativo.
- Proyecto Firebase `safeinspect-c2e17` configurado.
- Aplicación Android registrada en Firebase.
- Firebase Authentication habilitado.
- Inicio de sesión con usuario de Firebase probado desde el emulador.
- Navegación al panel principal después de autenticarse.
- Capas de modelos, repositorios y servicios presentes en el código.
- Servicios para Firestore, Storage y sincronización implementados en la arquitectura.

### Pendiente de validación funcional final

- Prueba completa de creación de una inspección y persistencia en Firestore.
- Prueba de carga de evidencias en Storage.
- Prueba integral Offline → Online y confirmación de sincronización.
- Ejecución final de la matriz de pruebas y captura de evidencias.

No se presentan como resultados validados funcionalidades que aún no hayan sido comprobadas durante las pruebas finales.

## 7. Estructura del repositorio

```text
Dise-oaplicacionesmoviles/
├── app/
│   ├── lib/
│   │   ├── core/
│   │   ├── models/
│   │   ├── repositories/
│   │   ├── screens/
│   │   └── services/
│   ├── test/
│   ├── pubspec.yaml
│   └── analysis_options.yaml
├── docs/
│   ├── arquitectura/
│   ├── implementacion/
│   ├── requisitos/
│   ├── seguridad/
│   └── pruebas/
├── presentation/
│   └── Presentacion_SafeInspect_Mobile.pdf
└── README.md
```

## 8. Instalación y ejecución

Desde la carpeta `app/`:

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

### Configuración de Firebase

La configuración de Firebase se genera mediante FlutterFire. En una instalación nueva, iniciar sesión con Firebase CLI y ejecutar desde `app/`:

```bash
firebase login
flutterfire configure --project=safeinspect-c2e17
flutter pub get
flutter run
```

`flutterfire configure` genera `lib/firebase_options.dart` con los identificadores de configuración necesarios para las plataformas seleccionadas. Firebase documenta este flujo como la configuración recomendada para proyectos Flutter. 

**No publicar contraseñas, tokens, credenciales privadas ni secretos en GitHub.** Los identificadores incluidos en la configuración de Firebase no sustituyen las reglas de seguridad del proyecto.

## 9. Pruebas

La matriz de pruebas se encuentra en [`docs/pruebas/matriz-pruebas.md`](docs/pruebas/matriz-pruebas.md).

Las pruebas se dividen en validaciones de interfaz, autenticación, persistencia, servicios cloud y sincronización. El proyecto también incluye pruebas automatizadas de widgets.

## 10. Documentación y presentación

- [Arquitectura](docs/arquitectura/README.md)
- [Configuración Firebase](docs/arquitectura/firebase-configuracion.md)
- [Flujo Offline-First](docs/arquitectura/flujo-offline-first.md)
- [Modelo de datos](docs/modelo-datos.md)
- [Requisitos funcionales](docs/requisitos/requisitos-funcionales.md)
- [Requisitos no funcionales](docs/requisitos/requisitos-no-funcionales.md)
- [Seguridad Firebase](docs/seguridad/firebase-rules.md)
- [Matriz de pruebas](docs/pruebas/matriz-pruebas.md)
- [Presentación](presentation/Presentacion_SafeInspect_Mobile.pdf)
- [Estado de validación de la Entrega 1](docs/estado-validacion-entrega-1.md)
- [Relación con la rúbrica ABP](docs/entrega-1-rubrica.md)

## 11. Metodología

**Mobile Agile / Scrum**, con iteraciones cortas, prototipado UX/UI, implementación incremental y validación progresiva.

## 12. Autor

**Jorge Ignacio Torres Parra**  
Ingeniería Informática — Fundación Universitaria Católica del Norte  
2026

## 13. Propósito académico

Proyecto desarrollado para el **Taller ABP — Diseño de Aplicaciones Móviles**.
