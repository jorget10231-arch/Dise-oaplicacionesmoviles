# Modelo de datos — SafeInspect Mobile

## Objetivo

Definir las entidades principales que utilizará SafeInspect Mobile para registrar inspecciones, hallazgos y evidencias, manteniendo una estructura preparada para Firebase y para la persistencia local.

## Entidades

### Usuario

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | String | Identificador único del usuario |
| `email` | String | Correo utilizado para autenticación |
| `name` | String | Nombre del usuario |
| `role` | String | Rol dentro de la aplicación |

### Inspección

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | String | Identificador único de la inspección |
| `title` | String | Nombre o título |
| `location` | String | Lugar de la inspección |
| `date` | DateTime | Fecha de registro |
| `status` | String | Estado del registro |
| `userId` | String | Usuario responsable |
| `findings` | List | Hallazgos asociados |
| `synced` | Boolean | Indica si fue sincronizada |

### Hallazgo

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | String | Identificador único |
| `inspectionId` | String | Inspección relacionada |
| `description` | String | Descripción del hallazgo |
| `severity` | String | Nivel de severidad |
| `createdAt` | DateTime | Fecha de creación |

### Evidencia

| Campo | Tipo | Descripción |
|---|---|---|
| `id` | String | Identificador único |
| `inspectionId` | String | Inspección relacionada |
| `findingId` | String | Hallazgo relacionado, si aplica |
| `localPath` | String | Ruta temporal/local de la evidencia |
| `storageUrl` | String | URL de Firebase Storage después de sincronizar |
| `synced` | Boolean | Estado de sincronización |

## Relación conceptual

```text
Usuario
   │
   │ 1:N
   ▼
Inspección
   │
   ├──────── 1:N ────────► Hallazgo
   │                         │
   │                         │ 1:N
   │                         ▼
   └────────────────────► Evidencia
```

## Firebase

La estructura objetivo contempla las siguientes colecciones:

```text
users/{userId}
inspections/{inspectionId}
inspections/{inspectionId}/findings/{findingId}
```

Las evidencias fotográficas se almacenarán en Firebase Storage y sus referencias se asociarán a la inspección o al hallazgo correspondiente.

## Offline-First

Los campos `synced` y `localPath` permiten diferenciar información que todavía permanece en el dispositivo de aquella que ya fue confirmada en la nube. La estrategia exacta de persistencia local y resolución de conflictos se definirá durante la implementación.

## Estado

Este documento define el modelo objetivo para las siguientes iteraciones. El modelo actual de Dart se encuentra parcialmente preparado y será ampliado conforme se implementen autenticación, Firestore, Storage y sincronización.
