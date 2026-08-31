# Flujo funcional de una inspección

## Objetivo

Definir el flujo que seguirá el inspector desde el acceso a SafeInspect Mobile hasta el registro de una inspección y su posterior consulta.

## Flujo principal

```text
Inicio
  ↓
Inicio de sesión
  ↓
Dashboard
  ↓
Nueva inspección
  ↓
Registrar información básica
  ├── Nombre
  └── Ubicación
  ↓
Registrar hallazgo / observación
  ↓
Agregar evidencia fotográfica
  ↓
Validar información
  ↓
Guardar inspección
  ↓
¿Existe conectividad?
  ├── SÍ → enviar/sincronizar con Firebase
  └── NO → conservar como pendiente local
                         ↓
                  recuperar conexión
                         ↓
                    sincronizar
  ↓
Consultar historial
  ↓
Fin
```

## Estados de una inspección

- **Borrador:** información en proceso de registro.
- **Pendiente de sincronización:** información guardada localmente mientras no existe conectividad.
- **Sincronizada:** información enviada correctamente a Firebase.

## Relación con los requisitos

Este flujo cubre principalmente RF01 a RF09 y sirve como referencia para las pruebas funcionales de las siguientes iteraciones.

## Estado de implementación

El flujo documenta la solución objetivo. En la Entrega 1, algunas etapas se encuentran implementadas como estructura de interfaz y otras quedan preparadas para la integración real con Firebase y la persistencia Offline-First.
