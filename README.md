# 📱 SafeInspect Mobile

Aplicación móvil para el registro y seguimiento de inspecciones de seguridad industrial, desarrollada como proyecto académico de Ingeniería Informática.

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
| **Flutter / Dart** | Desarrollo de la aplicación móvil |
| **Firebase Authentication** | Autenticación de usuarios |
| **Cloud Firestore** | Persistencia de inspecciones en la nube |
| **Firebase Storage** | Servicio previsto para evidencias multimedia |
| **SharedPreferences** | Persistencia local de inspecciones |
| **Git / GitHub** | Control de versiones, trazabilidad y entrega |
| **Figma** | Diseño y prototipado de interfaces |

La selección tecnológica responde al contexto del problema: una aplicación móvil facilita el registro en campo; Flutter permite mantener una base de código preparada para diferentes plataformas; Firebase proporciona servicios administrados para autenticación y datos; y el enfoque Offline-First reduce la dependencia de una conexión permanente.

## 4. Arquitectura

```text
┌────────────────────────────────────────┐
│              PRESENTACIÓN              │
│ Login · Home · Inspección · Historial  │
└────────────────────┬───────────────────┘
                     │
                     ▼
┌────────────────────────────────────────┐
│                SERVICIOS               │
│ Auth · Firestore · Sync · Orquestación │
└────────────────────┬───────────────────┘
                     │
                     ▼
┌────────────────────────────────────────┐
│              REPOSITORIOS              │
│       Persistencia local / acceso      │
│              a información             │
└───────────────┬────────────────────────┘
                │
        ┌───────┴────────┐
        ▼                ▼
┌───────────────┐  ┌─────────────────────┐
│ PERSISTENCIA  │  │       FIREBASE      │
│ LOCAL         │  │ Authentication      │
│ SharedPrefs   │  │ Cloud Firestore     │
└───────────────┘  │ Storage (evolución) │
                   └─────────────────────┘
```

La estructura del código separa pantallas, modelos, repositorios y servicios para reducir acoplamiento y facilitar la evolución del producto.

## 5. Flujo funcional

```text
Inicio de sesión
       ↓
Panel principal
       ↓
Nueva inspección
       ↓
Registro de información
       ↓
Persistencia local
       ↓
Registro pendiente
       ↓
Sincronización solicitada
       ↓
Firebase Cloud Firestore
       ↓
Registro marcado como sincronizado
```

El flujo permite registrar primero la información localmente y posteriormente sincronizar los registros pendientes con Firestore.

## 6. Funcionalidades implementadas

### Autenticación

Inicio de sesión mediante Firebase Authentication con correo electrónico y contraseña.

### Registro de inspecciones

Formulario para diligenciar y guardar información de una inspección.

### Persistencia local

Las inspecciones se almacenan localmente mediante `SharedPreferences`, permitiendo conservar registros antes de su sincronización.

### Historial

Consulta de las inspecciones almacenadas localmente.

### Gestión de pendientes

Los registros que todavía no han sido enviados a la nube permanecen identificados como pendientes.

### Sincronización con Firestore

`InspectionSyncService` obtiene los registros pendientes, los envía a la colección `inspections` de Cloud Firestore y, cuando la escritura es exitosa, actualiza el estado local del registro como sincronizado.

Esta funcionalidad fue probada con el proyecto Firebase `safeinspect-c2e17` después de habilitar la base de datos Firestore predeterminada.

## 7. Estado de implementación de la Entrega 1

### ✅ Validado

- Flutter configurado para Android.
- Android SDK y emulador operativo.
- Proyecto Firebase `safeinspect-c2e17` configurado.
- Aplicación Android registrada en Firebase.
- Firebase Authentication habilitado.
- Inicio de sesión probado desde el emulador.
- Navegación al panel principal después de autenticarse.
- Registro de inspecciones.
- Persistencia local con `SharedPreferences`.
- Historial de inspecciones.
- Identificación de registros pendientes.
- Sincronización funcional con Cloud Firestore.
- Pruebas automatizadas ejecutadas correctamente.
- `flutter analyze` ejecutado sin problemas.
- Repositorio GitHub público con documentación y trazabilidad del desarrollo.

### ⏳ Pendiente / evolución futura

- Implementación y validación completa de carga de evidencias fotográficas mediante Firebase Storage.
- Fortalecimiento y validación final de las reglas de seguridad de Firestore.
- Ampliación de pruebas Offline → Online y escenarios de recuperación de conectividad.
- Ampliación de funcionalidades de inspección, reportes e indicadores.

No se presentan como resultados validados funcionalidades que todavía no hayan sido comprobadas de extremo a extremo.

## 8. Estructura del repositorio

```text
Dise-oaplicacionesmoviles/
├── app/
│   ├── lib/
│   │   ├── core/
│   │   ├── models/
│   │   ├── repositories/
│   │   ├── screens/
│   │   └── services/
│   ├── android/
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

## 9. Requisitos para ejecutar el proyecto

- Flutter SDK.
- Dart SDK incluido con Flutter.
- Android Studio y Android SDK.
- Dispositivo Android físico o emulador.
- Proyecto Firebase configurado para la aplicación.
- Git.

## 10. Instalación y ejecución

Clonar el repositorio:

```bash
git clone https://github.com/jorget10231-arch/Dise-oaplicacionesmoviles.git
```

Ingresar al proyecto Flutter:

```bash
cd Dise-oaplicacionesmoviles/app
```

Instalar dependencias:

```bash
flutter pub get
```

Verificar el entorno:

```bash
flutter doctor
```

Analizar el proyecto:

```bash
flutter analyze
```

Ejecutar las pruebas:

```bash
flutter test
```

Ejecutar la aplicación:

```bash
flutter run
```

## 11. Configuración de Firebase

La integración de Firebase se realizó mediante FlutterFire.

Proyecto Firebase utilizado:

```text
safeinspect-c2e17
```

Identificador de la aplicación Android:

```text
com.example.safeinspect_mobile
```

En una instalación nueva, después de configurar Firebase CLI, puede ejecutarse desde `app/`:

```bash
firebase login
flutterfire configure --project=safeinspect-c2e17
flutter pub get
flutter run
```

La configuración de Firebase debe corresponder al proyecto autorizado para la aplicación. No se deben publicar contraseñas, tokens, claves privadas ni otros secretos en GitHub.

## 12. Persistencia y sincronización

La solución utiliza una estrategia de persistencia local seguida de sincronización con la nube:

```text
Usuario
   │
   ▼
Nueva inspección
   │
   ▼
SharedPreferences
   │
   ▼
Pendiente de sincronización
   │
   ▼
InspectionSyncService
   │
   ▼
Cloud Firestore
   │
   ▼
Estado local: sincronizado
```

La sincronización utiliza el identificador de la inspección para escribir en la colección `inspections` y conservar la trazabilidad del registro.

## 13. Modelo de datos

Las inspecciones se representan mediante un modelo de dominio dentro de la aplicación. El modelo permite convertir la información a una estructura compatible con la persistencia local y con Firestore.

Colección utilizada en Firestore:

```text
inspections
```

La definición detallada del modelo se encuentra en la documentación del proyecto.

## 14. Seguridad

La autenticación se gestiona mediante Firebase Authentication.

El acceso a los datos almacenados en Firestore debe estar controlado mediante Firebase Security Rules. Para una configuración académica o de producción no se deben utilizar reglas abiertas como `allow read, write: if true;`.

La configuración de Firebase publicada en el proyecto no debe considerarse un mecanismo de autorización por sí sola; la protección real de los datos depende de la autenticación y de las reglas de seguridad configuradas en Firebase.

## 15. Pruebas y validación

Se realizaron validaciones de entorno, análisis estático, pruebas automatizadas y pruebas funcionales sobre los principales flujos implementados.

### Análisis estático

```bash
flutter analyze
```

Resultado validado:

```text
No issues found!
```

### Pruebas automatizadas

```bash
flutter test
```

Resultado validado durante el desarrollo:

```text
00:07 +2: All tests passed!
```

### Validación funcional

Se validaron los siguientes procesos:

- Inicio de sesión.
- Acceso al panel principal.
- Registro de inspecciones.
- Persistencia local.
- Consulta del historial.
- Identificación de registros pendientes.
- Sincronización con Cloud Firestore.

La sincronización con Firestore fue comprobada utilizando el proyecto Firebase configurado para SafeInspect Mobile.

La matriz de pruebas y el estado de validación se encuentran en `docs/`.

## 16. Documentación y presentación

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

## 17. Metodología

**Mobile Agile / Scrum**, con iteraciones cortas, prototipado UX/UI, implementación incremental y validación progresiva.

## 18. Repositorio

El código fuente, documentación y trazabilidad del proyecto se encuentran en GitHub:

https://github.com/jorget10231-arch/Dise-oaplicacionesmoviles

El repositorio constituye la fuente principal de control de versiones y seguimiento del proyecto.

## 19. Autor

**Jorge Ignacio Torres Parra**  
Ingeniería Informática — Fundación Universitaria Católica del Norte  
2026

## 20. Propósito académico

Proyecto desarrollado para el **Taller ABP — Diseño de Aplicaciones Móviles**.

El contenido de este README corresponde al estado alcanzado para la **Entrega 1** y distingue entre funcionalidades validadas y funcionalidades previstas para futuras iteraciones.
