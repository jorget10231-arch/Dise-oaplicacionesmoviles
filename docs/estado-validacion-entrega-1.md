# Estado de validación — Entrega 1

## Propósito

Este documento registra el estado técnico comprobado de SafeInspect Mobile para la Entrega 1 del Taller ABP.

## Fecha de corte

2 de septiembre de 2026.

## Validaciones realizadas

| Validación | Estado | Evidencia / resultado |
|---|---|---|
| Flutter configurado | ✅ | `flutter --version` |
| Android SDK y herramientas | ✅ | `flutter doctor` |
| Emulador Android | ✅ | `flutter devices` / ejecución de la app |
| Dependencias | ✅ | `flutter pub get` |
| Firebase CLI | ✅ | CLI instalada y utilizada |
| FlutterFire CLI | ✅ | versión 1.4.1 |
| Proyecto Firebase | ✅ | `safeinspect-c2e17` |
| Aplicación Android registrada | ✅ | configuración FlutterFire |
| Firebase Authentication | ✅ | proveedor habilitado |
| Inicio de sesión | ✅ | prueba realizada en emulador |
| Panel principal | ✅ | navegación posterior al login |
| Registro de inspecciones | ✅ | formulario funcional |
| Persistencia local | ✅ | `SharedPreferencesInspectionRepository` |
| Historial local | ✅ | pantalla de historial funcional |
| Gestión de pendientes | ✅ | registros no sincronizados identificados |
| Firestore | ✅ | base de datos predeterminada creada y escritura funcional |
| Sincronización local → Firestore | ✅ | `InspectionSyncService` probado funcionalmente |
| Pruebas automatizadas | ✅ | `flutter test` → `00:07 +2: All tests passed!` |
| Análisis estático | ✅ | `flutter analyze` → `No issues found!` |
| Firebase Storage | ⏳ | pendiente de implementación/validación integral |
| Offline → Online integral | ⏳ | pendiente de prueba formal con evidencia |
| Reglas finales de seguridad | ⏳ | pendiente de revisión y validación final |

## Resultado actual

La aplicación se ejecuta en Android y el flujo de autenticación fue probado con un usuario registrado en Firebase. La aplicación permite acceder al panel principal, registrar inspecciones, conservarlas localmente y consultar su historial.

La sincronización con Cloud Firestore fue validada después de crear la base de datos predeterminada del proyecto Firebase `safeinspect-c2e17`. El servicio de sincronización obtiene los registros pendientes, los escribe en la colección `inspections` y actualiza su estado local cuando la operación es exitosa.

## Criterio de evidencia

Solo se consideran resultados validados aquellos que fueron ejecutados y observados durante las pruebas. La existencia de una clase o servicio en el código demuestra implementación, pero no por sí sola una prueba funcional de extremo a extremo.

## Pendientes de la Entrega 1 / evolución

1. Implementar y validar la carga de evidencias fotográficas mediante Firebase Storage.
2. Revisar y fortalecer las reglas de seguridad de Firestore.
3. Ejecutar una prueba formal del flujo Offline → Online con evidencia.
4. Actualizar la matriz de pruebas con las evidencias disponibles.
5. Incorporar la presentación final organizada por el estudiante en `presentation/`.

## Conclusión

El núcleo funcional alcanzado para la Entrega 1 comprende autenticación, registro, persistencia local, historial y sincronización con Firestore. Las funcionalidades pendientes se mantienen identificadas explícitamente para evitar presentar como terminados componentes que todavía no han sido validados integralmente.
