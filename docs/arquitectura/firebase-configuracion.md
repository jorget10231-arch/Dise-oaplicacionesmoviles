# Configuración de Firebase — SafeInspect Mobile

## Objetivo

Documentar la configuración necesaria para conectar la aplicación Flutter con Firebase sin exponer credenciales ni archivos sensibles en el repositorio público.

## Servicios a habilitar

1. Firebase Authentication.
2. Cloud Firestore.
3. Firebase Storage.

## Flujo de configuración

```text
Crear proyecto Firebase
        ↓
Registrar aplicación Android
        ↓
Configurar FlutterFire
        ↓
Generar firebase_options.dart
        ↓
Inicializar Firebase en Flutter
        ↓
Habilitar Authentication
        ↓
Crear Firestore
        ↓
Configurar Storage
        ↓
Aplicar reglas de seguridad
        ↓
Realizar pruebas
```

## Configuración de Authentication

Habilitar el proveedor de autenticación que utilizará SafeInspect. Para la primera versión se contempla correo electrónico y contraseña.

## Configuración de Firestore

Crear la base de datos en modo apropiado para el entorno del proyecto y posteriormente aplicar reglas de seguridad que limiten el acceso a usuarios autenticados.

Colecciones objetivo:

```text
users/{userId}
inspections/{inspectionId}
inspections/{inspectionId}/findings/{findingId}
```

## Configuración de Storage

Crear el almacenamiento para las evidencias fotográficas.

Ruta conceptual:

```text
inspections/{inspectionId}/evidence/{fileId}
```

## Integración con Flutter

La aplicación deberá inicializar Firebase antes de ejecutar la interfaz principal. La configuración específica del proyecto será generada con FlutterFire CLI cuando el entorno Flutter/Android esté disponible.

## Seguridad del repositorio

No se deben publicar:

- claves privadas;
- contraseñas;
- tokens;
- secretos de servicios;
- archivos de credenciales sensibles.

Los archivos de configuración necesarios para una aplicación cliente se deben gestionar de acuerdo con la configuración y recomendaciones del proyecto Firebase, evitando incorporar secretos administrativos al repositorio público.

## Estado

**Pendiente de ejecución:** esta guía define el procedimiento. La conexión con el proyecto Firebase real se realizará cuando el entorno Flutter/Android esté operativo.
