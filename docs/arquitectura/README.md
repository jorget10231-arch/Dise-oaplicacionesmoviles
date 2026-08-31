# Arquitectura de SafeInspect Mobile

## Objetivo

La aplicación se organiza de forma modular para separar la interfaz, los modelos de datos, la lógica de acceso a datos y los servicios externos.

## Flujo de capas

```text
Usuario
  |
  v
Screens / Widgets
  |
  v
Repositories
  |
  +-------------------+
  |                   |
  v                   v
Servicios Firebase   Persistencia local
  |                   |
  +---------+---------+
            |
            v
     Sincronización
            |
            v
        Firebase
   +--------+---------+
   |        |         |
   v        v         v
Auth    Firestore   Storage
```

## Organización del código

- `core/`: constantes y configuración transversal.
- `models/`: entidades y representación de datos.
- `screens/`: pantallas y flujos de usuario.
- `services/`: integración con servicios externos.
- `repositories/`: abstracción del acceso y persistencia de datos.
- `widgets/`: componentes reutilizables de interfaz.

## Principios aplicados

- Separación de responsabilidades.
- Modularidad.
- Reutilización de componentes.
- Abstracción del acceso a datos mediante repositorios.
- Preparación para crecimiento funcional y sincronización Offline-First.

## Estado

Esta arquitectura corresponde a la Entrega 1. La persistencia local y la sincronización Offline-First serán implementadas y validadas en las siguientes iteraciones.
