# Entrega 1 — Relación con la rúbrica ABP

## Objetivo

Este documento relaciona la estructura y el estado de SafeInspect Mobile con los cinco criterios de evaluación del Taller ABP — Entrega 1.

## 1. Análisis del problema y justificación tecnológica — 20%

**Evidencias:**

- Situación problema y pregunta problema en el README principal.
- Objetivo general.
- Justificación de Flutter, Firebase y Offline-First.
- Requisitos funcionales y no funcionales en `docs/requisitos/`.

**Argumento:** la solución parte de una necesidad de registro y trazabilidad de inspecciones en campo y considera explícitamente escenarios de conectividad limitada.

## 2. Arquitectura de la solución y buenas prácticas — 25%

**Evidencias:**

- Separación entre `screens`, `services`, `repositories` y `models`.
- Documentación de arquitectura en `docs/arquitectura/`.
- Servicios diferenciados para autenticación, Firestore, Storage y sincronización.
- Estrategia Offline-First documentada.

**Argumento:** la separación por responsabilidades permite evolucionar la aplicación sin concentrar la lógica de negocio en las pantallas.

## 3. Calidad y estructura del repositorio GitHub — 20%

**Evidencias:**

- Repositorio público.
- README principal.
- Código fuente en `app/`.
- Documentación en `docs/`.
- Presentación en `presentation/`.
- Historial de commits asociado a las fases de construcción.

## 4. Material de soporte — 15%

**Evidencia:**

- `presentation/Presentacion_SafeInspect_Mobile.pdf`.
- Documentación técnica de arquitectura, requisitos, seguridad y pruebas.

## 5. Rigor técnico y potencial de investigación — 20%

**Evidencias:**

- Arquitectura modular.
- Enfoque Offline-First.
- Sincronización local/cloud.
- Firebase Authentication.
- Firestore y Storage.
- Gestión de hallazgos y evidencias.
- Matriz de pruebas.

**Potencial:** la estrategia Offline-First y la trazabilidad de inspecciones constituyen una base para futuras iteraciones de sincronización, análisis de datos y ampliación de capacidades de inspección.

## Estado

La documentación y estructura del repositorio están preparadas para la Entrega 1. Las funcionalidades que requieren prueba de extremo a extremo con Firestore, Storage y sincronización permanecen marcadas como pendientes hasta completar su validación.
