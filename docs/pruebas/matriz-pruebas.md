# Matriz de pruebas — SafeInspect Mobile

## Objetivo

Definir las pruebas que permitirán verificar el cumplimiento de los requisitos funcionales y no funcionales de SafeInspect Mobile.

> **Importante:** esta matriz define las pruebas. El resultado se marcará como aprobado únicamente después de ejecutar cada prueba en el entorno real de la aplicación.

| ID | Requisito | Prueba | Resultado esperado | Estado |
|---|---|---|---|---|
| PT01 | RF01 | Iniciar sesión con credenciales válidas | El usuario accede al dashboard | Pendiente |
| PT02 | RF01 | Iniciar sesión con credenciales inválidas | Se informa el error y no se permite el acceso | Pendiente |
| PT03 | RF02 | Crear una nueva inspección | La inspección se crea correctamente | Pendiente |
| PT04 | RF03 | Registrar nombre y ubicación | Los datos quedan asociados a la inspección | Pendiente |
| PT05 | RF04 | Registrar un hallazgo | El hallazgo queda asociado a la inspección | Pendiente |
| PT06 | RF05 | Adjuntar una fotografía | La evidencia queda asociada al registro | Pendiente |
| PT07 | RF06 | Crear inspección sin Internet | La información se conserva localmente | Pendiente |
| PT08 | RF07 | Consultar registros pendientes | Se identifican los registros no sincronizados | Pendiente |
| PT09 | RF08 | Recuperar conectividad | Los registros pendientes se sincronizan con Firebase | Pendiente |
| PT10 | RF09 | Consultar historial | Se muestran las inspecciones disponibles | Pendiente |
| PT11 | RF10 | Cerrar sesión | La sesión termina correctamente | Pendiente |
| PT12 | RNF04 | Transmitir información | La comunicación utiliza mecanismos seguros | Pendiente |
| PT13 | RNF05 | Acceder a datos sin autorización | Firebase bloquea el acceso no permitido | Pendiente |
| PT14 | RNF06 | Revisar estructura del código | Se mantienen separadas las responsabilidades | Pendiente |
| PT15 | RNF09 | Enviar formulario incompleto | La aplicación solicita los campos obligatorios | Pendiente |

## Evidencias

Cuando las pruebas sean ejecutadas, las evidencias se almacenarán en:

```text
docs/evidencias/pruebas/
```

Convención sugerida:

```text
PT01-login-valido.png
PT02-login-invalido.png
PT03-crear-inspeccion.png
PT07-sin-conexion.png
PT09-sincronizacion.png
```

## Criterios de aceptación

- **Aprobada:** el resultado observado coincide con el resultado esperado.
- **Fallida:** el resultado observado no coincide con el resultado esperado.
- **Pendiente:** todavía no se ha ejecutado en el entorno de prueba.

## Trazabilidad

La matriz relaciona requisitos con pruebas para facilitar la trazabilidad:

```text
Requisito → Caso de uso → Implementación → Prueba → Evidencia
```

## Estado de la matriz

La matriz está preparada para la etapa de validación. No se presentan resultados como exitosos hasta contar con evidencia de ejecución.
