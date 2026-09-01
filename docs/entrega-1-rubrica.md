# Entrega 1 — Relación con la rúbrica ABP

## Objetivo

Este documento relaciona la estructura y el estado de SafeInspect Mobile con los cinco criterios de evaluación del Taller ABP — Entrega 1.

## 1. Análisis del problema y justificación tecnológica — 20%

**Evidencias:**

- Situación problema y pregunta problema en el README principal.
- Objetivo general.
- Justificación de Flutter, Firebase y enfoque Offline-First.
- Requisitos funcionales y no funcionales en `docs/requisitos/`.

**Estado:** Alto.

La solución parte de una necesidad concreta de registro y trazabilidad de inspecciones en campo y considera explícitamente escenarios de conectividad limitada.

## 2. Arquitectura de la solución y buenas prácticas — 25%

**Evidencias:**

- Separación entre `screens`, `services`, `repositories` y `models`.
- Documentación de arquitectura en `docs/arquitectura/`.
- Servicio de autenticación.
- Servicios de Firestore y sincronización.
- Estrategia de persistencia local.
- Pruebas automatizadas y análisis estático.

**Estado:** Alto.

La separación por responsabilidades permite mantener la lógica de acceso a datos y servicios fuera de las pantallas y facilita la evolución de la aplicación.

## 3. Calidad y estructura del repositorio GitHub — 20%

**Evidencias:**

- Repositorio público.
- README principal organizado.
- Código fuente en `app/`.
- Documentación técnica en `docs/`.
- Historial de commits asociado a las fases de construcción.
- Configuración Android y Firebase integrada en el proyecto.

**Estado:** Alto.

El repositorio mantiene el código fuente y la documentación como fuente de trazabilidad del proyecto.

## 4. Material de soporte — 15%

**Evidencias:**

- Material de presentación en `presentation/`.
- Documentación técnica de arquitectura, requisitos, seguridad y pruebas.

**Estado:** Alto, sujeto a la organización final de la presentación antes de la entrega.

## 5. Rigor técnico y potencial de investigación — 20%

**Evidencias:**

- Arquitectura modular.
- Enfoque Offline-First.
- Persistencia local.
- Sincronización local/cloud.
- Firebase Authentication.
- Cloud Firestore.
- Gestión de inspecciones e historial.
- Pruebas automatizadas.
- Matriz de pruebas y documentación técnica.

**Estado:** Alto.

**Potencial:** la estrategia Offline-First y la trazabilidad de inspecciones constituyen una base para futuras iteraciones relacionadas con sincronización avanzada, manejo de conflictos, análisis de datos, evidencias multimedia y ampliación de capacidades de inspección.

## Estado general de la Entrega 1

El núcleo funcional de la aplicación fue implementado y validado: autenticación, registro de inspecciones, persistencia local, historial, gestión de pendientes y sincronización con Cloud Firestore.

La sincronización con Firestore fue comprobada utilizando el proyecto Firebase `safeinspect-c2e17`, después de crear la base de datos predeterminada requerida para la operación del servicio.

Permanecen como evolución o validación pendiente la implementación integral de evidencia fotográfica con Firebase Storage, la revisión final de reglas de seguridad y una prueba formal documentada del flujo Offline → Online.

La documentación distingue explícitamente entre funcionalidades implementadas y funcionalidades validadas, evitando presentar como terminados componentes que todavía no han sido comprobados de extremo a extremo.
