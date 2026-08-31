# Requisitos no funcionales — SafeInspect Mobile

Los requisitos no funcionales establecen las características de calidad que debe cumplir la solución.

| ID | Requisito | Criterio |
|---|---|---|
| RNF01 | La aplicación deberá presentar una interfaz clara y sencilla para el personal que realiza inspecciones en campo. | Usabilidad |
| RNF02 | La aplicación deberá permitir el registro de información aun cuando exista baja o nula conectividad, mediante una estrategia Offline-First. | Disponibilidad |
| RNF03 | Los datos pendientes deberán sincronizarse con la nube cuando se recupere la conectividad. | Confiabilidad |
| RNF04 | La información transmitida hacia los servicios cloud deberá utilizar comunicaciones seguras. | Seguridad |
| RNF05 | El acceso a los datos deberá estar controlado mediante autenticación y reglas de seguridad de Firebase. | Seguridad |
| RNF06 | La arquitectura deberá separar presentación, modelos, repositorios y servicios para facilitar mantenimiento y evolución. | Mantenibilidad |
| RNF07 | La solución deberá permitir ampliar posteriormente sus funcionalidades sin modificar innecesariamente los componentes existentes. | Escalabilidad |
| RNF08 | Las evidencias fotográficas deberán almacenarse mediante un servicio de almacenamiento cloud. | Disponibilidad |
| RNF09 | La aplicación deberá validar los datos obligatorios antes de guardar una inspección. | Integridad |
| RNF10 | El código fuente deberá mantenerse organizado y documentado dentro del repositorio público de GitHub. | Calidad |

## Nota

Estos requisitos corresponden al diseño de la solución. Su cumplimiento deberá verificarse mediante pruebas durante las siguientes iteraciones del proyecto.
