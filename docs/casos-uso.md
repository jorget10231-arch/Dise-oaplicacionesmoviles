# Casos de uso — SafeInspect Mobile

## Actor principal

**Inspector:** persona encargada de realizar inspecciones de seguridad industrial y registrar la información en SafeInspect Mobile.

## Casos de uso

| ID | Caso de uso | Actor | Resultado esperado |
|---|---|---|---|
| CU01 | Iniciar sesión | Inspector | Acceso autorizado a la aplicación |
| CU02 | Consultar dashboard | Inspector | Visualización de las funciones principales |
| CU03 | Crear inspección | Inspector | Nueva inspección creada en estado borrador |
| CU04 | Registrar hallazgo | Inspector | Hallazgo asociado a la inspección |
| CU05 | Adjuntar evidencia | Inspector | Evidencia asociada al hallazgo o inspección |
| CU06 | Guardar inspección | Inspector | Registro conservado y marcado según su estado de conectividad |
| CU07 | Trabajar sin conexión | Inspector | La información se conserva localmente |
| CU08 | Sincronizar inspección | Sistema | Registros pendientes enviados a Firebase al recuperar conectividad |
| CU09 | Consultar historial | Inspector | Visualización de inspecciones registradas |
| CU10 | Cerrar sesión | Inspector | Sesión terminada de forma segura |

## Detalle de casos críticos

### CU03 — Crear inspección

**Precondición:** el usuario está autenticado.

**Flujo:**
1. Selecciona `Nueva inspección`.
2. Registra nombre y ubicación.
3. Registra hallazgos u observaciones.
4. Adjunta evidencias cuando corresponda.
5. Valida la información.
6. Guarda la inspección.

**Postcondición:** existe un registro de inspección preparado para almacenamiento local o sincronización.

### CU07 — Trabajar sin conexión

**Precondición:** el usuario está autenticado y el dispositivo no dispone de conectividad.

**Flujo:**
1. El usuario crea o modifica una inspección.
2. La aplicación valida los datos.
3. Guarda la información en persistencia local.
4. Marca el registro como pendiente de sincronización.

**Postcondición:** la información permanece disponible en el dispositivo sin depender de Internet.

### CU08 — Sincronizar inspección

**Precondición:** existen registros pendientes y el dispositivo recupera conectividad.

**Flujo:**
1. La aplicación detecta conectividad.
2. Obtiene registros pendientes.
3. Envía los datos a Firestore.
4. Envía las evidencias a Storage cuando corresponda.
5. Confirma la operación.
6. Actualiza el estado a sincronizado.

**Postcondición:** la información queda disponible en Firebase y el registro local deja de estar pendiente.

## Trazabilidad

Los casos de uso se relacionan con los requisitos funcionales RF01–RF10 y servirán como base para diseñar las pruebas de aceptación.

## Estado

Estos casos de uso definen el comportamiento objetivo de la solución. Su implementación y validación se realizará progresivamente durante las siguientes iteraciones.
