# Arquitectura Cloud — Firebase

## Objetivo

Definir cómo SafeInspect Mobile utilizará Firebase como plataforma cloud para autenticación, persistencia de datos y almacenamiento de evidencias.

## Componentes

```text
                 SAFEINSPECT MOBILE
                        │
                        ▼
                 Firebase Platform
                        │
        ┌───────────────┼────────────────┐
        │               │                │
        ▼               ▼                ▼
 Authentication     Firestore         Storage
        │               │                │
        │               │                └── Fotografías
        │               │
        │               └── Inspecciones
        │                   └── Hallazgos
        │
        └── Usuarios
```

## Firebase Authentication

Se utilizará para controlar el acceso de los usuarios mediante credenciales autorizadas.

Responsabilidades:

- Inicio de sesión.
- Identificación del usuario autenticado.
- Control de sesión.
- Cierre de sesión.

## Cloud Firestore

Se utilizará como base de datos cloud para información estructurada.

Estructura conceptual:

```text
users/{userId}

inspections/{inspectionId}
    └── findings/{findingId}
```

Los registros de inspección estarán asociados al usuario responsable.

## Firebase Storage

Se utilizará para almacenar las evidencias fotográficas de las inspecciones.

```text
inspections/{inspectionId}/evidence/{fileId}
```

La aplicación conservará la referencia de la evidencia para relacionarla con la inspección o hallazgo correspondiente.

## Flujo de datos

```text
Inspector
   ↓
Flutter
   ↓
Repository
   ↓
Services
   ├── Authentication → identidad
   ├── Firestore → datos
   └── Storage → evidencias
```

## Seguridad

La implementación deberá aplicar autenticación y reglas de seguridad para limitar el acceso a los datos según el usuario autorizado. Las credenciales privadas y archivos de configuración sensibles no deben almacenarse en el repositorio público.

## Offline-First

Firebase representa la capa cloud. La persistencia local funcionará como capa temporal cuando no exista conectividad. Los registros pendientes se enviarán a Firestore y las evidencias a Storage cuando se recupere la conexión.

## Estado

Esta arquitectura define la integración cloud objetivo. La conexión real con el proyecto Firebase, las reglas de seguridad y las pruebas se realizarán durante las siguientes fases.
