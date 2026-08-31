# Estrategia Offline-First

## Objetivo

Permitir que SafeInspect Mobile continúe registrando información de una inspección cuando el dispositivo no tenga conectividad y sincronice posteriormente los datos con Firebase.

## Flujo

```text
Usuario
  ↓
SafeInspect Mobile
  ↓
Validar y guardar datos localmente
  ↓
¿Hay conectividad?
  ├── NO → estado: pendiente de sincronización
  │          ↓
  │       esperar conectividad
  │
  └── SÍ → enviar datos a Firebase
             ↓
          confirmar sincronización
             ↓
       estado: sincronizada
```

## Datos que deberán sincronizarse

- Datos generales de la inspección.
- Hallazgos u observaciones.
- Estado de la inspección.
- Referencias a evidencias fotográficas.
- Identificador del usuario responsable.

## Manejo de estados

La aplicación deberá diferenciar entre registros locales pendientes y registros confirmados en la nube para evitar presentar como sincronizada información que aún no ha sido enviada correctamente.

## Consideraciones

- La persistencia local debe evitar la pérdida de información ante ausencia temporal de Internet.
- La sincronización debe ejecutarse cuando se detecte conectividad disponible.
- Los errores de sincronización deben conservar el registro como pendiente para permitir un nuevo intento.
- Las credenciales y datos sensibles no deben almacenarse de forma insegura.

## Estado

Esta es la estrategia técnica definida para el proyecto. Su implementación y validación mediante pruebas corresponde a las siguientes iteraciones.
