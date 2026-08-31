# Persistencia local y sincronización Offline-First

## Objetivo

Definir la estrategia mediante la cual SafeInspect Mobile conservará las inspecciones en el dispositivo cuando no exista conectividad y posteriormente las sincronizará con Firebase.

## Arquitectura

```text
                 SafeInspect Mobile
                         │
                         ▼
                InspectionRepository
                         │
                  ┌──────┴──────┐
                  │             │
                  ▼             ▼
          Persistencia local  Firebase
                  │             │
                  │         Firestore / Storage
                  │             │
                  └──────┬──────┘
                         ▼
                  Estado sincronizado
```

## Flujo de guardado

1. El usuario completa la inspección.
2. La aplicación valida los campos obligatorios.
3. La inspección se guarda primero en almacenamiento local.
4. El registro queda con `synced = false`.
5. Si existe conectividad, se intenta sincronizar inmediatamente.
6. Si no existe conectividad, el registro permanece pendiente.

## Flujo de sincronización

```text
Registro local
     ↓
¿synced = false?
     ↓ Sí
¿Hay conectividad?
   ├── No → mantener pendiente
   │
   └── Sí
        ↓
   enviar inspección
        ↓
   enviar evidencias
        ↓
   confirmar operación
        ↓
   synced = true
```

## Manejo de errores

Si una operación de sincronización falla:

- no se debe eliminar el registro local;
- se mantiene `synced = false`;
- se conserva la información para un nuevo intento;
- se debe registrar el error para facilitar diagnóstico.

## Identificación de registros

Cada inspección debe tener un identificador estable para evitar duplicados cuando se realicen nuevos intentos de sincronización.

## Evidencias fotográficas

Las fotografías podrán conservar inicialmente una referencia local (`localPath`). Después de recuperar conectividad, se cargarán a Firebase Storage y se almacenará la referencia cloud (`storageUrl`).

## Consistencia

La aplicación deberá considerar la sincronización como confirmada únicamente después de recibir una respuesta satisfactoria del servicio cloud. Hasta ese momento, el registro debe permanecer pendiente.

## Resolución de conflictos

Para la primera versión se prioriza evitar pérdida de información y duplicados mediante identificadores estables y estados de sincronización. Una estrategia avanzada de resolución de conflictos podrá incorporarse posteriormente si varios dispositivos modifican simultáneamente la misma inspección.

## Implementación prevista

La persistencia local concreta se seleccionará durante la implementación Flutter según las dependencias disponibles y las necesidades del proyecto. La decisión deberá documentarse antes de incorporar la dependencia al `pubspec.yaml`.

## Estado

**Diseño preparado.** La implementación real requiere ejecutar Flutter en el entorno Android y posteriormente conectar el proyecto Firebase.
