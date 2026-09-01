# Cierre de Entrega 1 — SafeInspect Mobile

## Alcance

Este documento resume el estado del proyecto frente a la rúbrica del Taller ABP — Entrega 1: Proyecto, Presentación y Repositorio en GitHub.

## Evidencia disponible

- Repositorio GitHub público.
- Aplicación Flutter estructurada y ejecutable en Android.
- Firebase configurado mediante FlutterFire para el proyecto `safeinspect-c2e17`.
- Firebase Authentication habilitado y probado desde el emulador.
- Panel principal de inspecciones accesible después de la autenticación.
- Arquitectura modular con modelos, pantallas, repositorios y servicios.
- Servicios preparados para Firestore, Storage y sincronización Offline-First.
- Documentación técnica y presentación PDF alojadas en el repositorio.

## Pendientes antes de declarar el cierre funcional total

Los siguientes puntos requieren prueba de extremo a extremo en el entorno local:

1. Crear y guardar una inspección.
2. Confirmar persistencia local.
3. Confirmar escritura y lectura en Cloud Firestore.
4. Registrar y cargar una evidencia fotográfica en Firebase Storage.
5. Ejecutar una inspección sin conectividad.
6. Recuperar conectividad y verificar la sincronización.
7. Ejecutar nuevamente `flutter analyze` y `flutter test` después de sincronizar la copia local con GitHub.

## Criterio de rigor

No se considera funcionalmente validado un componente solo por la existencia de su clase o servicio. La validación final debe incluir la ejecución del flujo y su evidencia observable.

## Relación con la rúbrica

- **Problema y justificación:** documentados en el README y en la arquitectura.
- **Arquitectura y buenas prácticas:** estructura modular, persistencia local y servicios desacoplados.
- **Repositorio:** código, documentación, pruebas y presentación organizados en GitHub.
- **Material de soporte:** presentación PDF y documentación técnica disponibles.
- **Rigor técnico:** enfoque Offline-First, autenticación, servicios cloud y trazabilidad mediante control de versiones.
