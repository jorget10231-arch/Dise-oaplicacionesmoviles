# Requisitos funcionales — SafeInspect Mobile

Los siguientes requisitos definen las funciones principales previstas para el proyecto y sirven como base para el desarrollo y las pruebas.

| ID | Requisito | Prioridad |
|---|---|---|
| RF01 | El sistema permitirá al usuario iniciar sesión mediante credenciales autorizadas. | Alta |
| RF02 | El sistema permitirá registrar una nueva inspección de seguridad industrial. | Alta |
| RF03 | El usuario podrá registrar el nombre y la ubicación de la inspección. | Alta |
| RF04 | El usuario podrá registrar hallazgos u observaciones asociados a una inspección. | Alta |
| RF05 | El usuario podrá adjuntar evidencias fotográficas a una inspección o hallazgo. | Alta |
| RF06 | El sistema permitirá guardar la información de una inspección cuando no exista conectividad. | Alta |
| RF07 | El sistema identificará los registros pendientes de sincronización. | Media |
| RF08 | El sistema sincronizará los registros pendientes con Firebase cuando se recupere la conectividad. | Alta |
| RF09 | El usuario podrá consultar el historial de inspecciones registradas. | Media |
| RF10 | El sistema permitirá cerrar sesión de forma segura. | Media |

## Flujo principal

```text
Iniciar sesión
      ↓
Dashboard
      ↓
Nueva inspección
      ↓
Datos + hallazgos + evidencias
      ↓
Guardar
      ↓
¿Hay conectividad?
   ├── No → almacenamiento local → pendiente
   └── Sí → Firebase → sincronizado
```

## Alcance de la Entrega 1

Los requisitos describen la solución objetivo. En esta entrega algunas funciones se encuentran en estructura o preparación y serán implementadas progresivamente en las siguientes iteraciones.
