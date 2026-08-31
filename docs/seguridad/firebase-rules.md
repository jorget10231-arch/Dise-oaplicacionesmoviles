# Reglas de seguridad — SafeInspect Mobile

## Objetivo

Definir el principio de mínimo privilegio para proteger los datos de SafeInspect en Firestore y Firebase Storage.

> Estas reglas son una propuesta para la configuración del proyecto Firebase. Deben probarse en el entorno real antes de considerarse productivas.

## Firestore — propuesta inicial

```text
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null
        && request.auth.uid == userId;
    }

    match /inspections/{inspectionId} {
      allow create: if request.auth != null
        && request.resource.data.userId == request.auth.uid;

      allow read, update, delete: if request.auth != null
        && resource.data.userId == request.auth.uid;
    }

    match /inspections/{inspectionId}/findings/{findingId} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Storage — propuesta inicial

```text
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /inspections/{inspectionId}/evidence/{fileName} {
      allow read, write: if request.auth != null;
    }
  }
}
```

## Principios de seguridad

- Requerir autenticación para operaciones sobre información protegida.
- Asociar las inspecciones al usuario autenticado mediante `userId`.
- Evitar reglas públicas de lectura y escritura.
- Aplicar mínimo privilegio.
- Validar datos desde la aplicación y reforzar controles mediante reglas cloud.
- No almacenar secretos administrativos en el repositorio público.

## Consideración sobre evidencias

La regla inicial de Storage permite operaciones a usuarios autenticados, pero antes de producción debe endurecerse para verificar que el usuario tenga autorización sobre la `inspectionId` correspondiente.

## Pruebas de seguridad previstas

1. Usuario no autenticado intenta leer una inspección → debe ser rechazado.
2. Usuario autenticado intenta acceder a una inspección de otro usuario → debe ser rechazado.
3. Usuario autenticado accede a su propia inspección → debe ser permitido.
4. Usuario no autenticado intenta cargar evidencia → debe ser rechazado.
5. Usuario autenticado autorizado carga evidencia → debe ser permitido.

## Estado

**Preparado para implementación y validación.** Las reglas no deben considerarse definitivas hasta ser probadas en el proyecto Firebase real.
