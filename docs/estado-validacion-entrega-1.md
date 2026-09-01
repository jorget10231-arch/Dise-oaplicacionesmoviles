# Estado de validación — Entrega 1

## Propósito

Este documento registra el estado técnico comprobado de SafeInspect Mobile para la Entrega 1 del Taller ABP.

## Fecha de corte

31 de agosto de 2026.

## Validaciones realizadas

| Validación | Estado | Evidencia |
|---|---|---|
| Flutter configurado | ✅ | `flutter --version` |
| Android SDK y herramientas | ✅ | `flutter doctor` |
| Emulador Android | ✅ | `flutter devices` / ejecución de la app |
| Dependencias | ✅ | `flutter pub get` |
| Firebase CLI | ✅ | `firebase --version` |
| FlutterFire CLI | ✅ | versión 1.4.1 |
| Proyecto Firebase | ✅ | `safeinspect-c2e17` |
| Aplicación Android registrada | ✅ | configuración FlutterFire |
| Firebase Authentication | ✅ | proveedor habilitado |
| Inicio de sesión | ✅ | prueba realizada en emulador |
| Panel de inspecciones | ✅ | navegación posterior al login |
| Firestore | ⏳ | pendiente de prueba funcional final |
| Storage | ⏳ | pendiente de prueba funcional final |
| Offline → Online | ⏳ | pendiente de prueba funcional final |

## Resultado actual

La aplicación se ejecuta en Android y el flujo de autenticación ya fue probado con un usuario registrado en Firebase. La aplicación permite llegar al panel principal después de iniciar sesión.

La arquitectura contiene servicios y repositorios destinados a Firestore, Storage y sincronización, pero estos componentes deben considerarse **pendientes de validación funcional integral** hasta completar las pruebas de extremo a extremo.

## Criterio de evidencia

Solo se consideran resultados validados aquellos que fueron ejecutados y observados durante las pruebas. La existencia de una clase o servicio en el código demuestra implementación, pero no por sí sola una prueba funcional de extremo a extremo.

## Próximas pruebas

1. Crear una inspección desde la aplicación.
2. Guardar la información.
3. Confirmar la persistencia local.
4. Confirmar la escritura en Firestore.
5. Registrar una evidencia fotográfica.
6. Confirmar la carga en Storage.
7. Repetir el flujo sin conectividad.
8. Recuperar la conectividad.
9. Confirmar la sincronización.
10. Registrar capturas y actualizar la matriz de pruebas.
