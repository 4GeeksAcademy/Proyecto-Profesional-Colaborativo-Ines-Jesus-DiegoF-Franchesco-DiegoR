# Notas técnicas — revisión del estado del repositorio

Documento de auditoría del proyecto **Maison Lumière**. Recoge los fallos
detectados al revisar el historial de Git, las ramas, los Pull Requests y el
código de las vistas, con el objetivo de dejar constancia y facilitar su
corrección. No sustituye al README (que describe cómo trabajar): esto es el
registro de qué estaba mal y qué se ha arreglado.

_Fecha de la revisión: 24/07/2026._

---

## 1. Resumen

El trabajo visual y de maquetación es de buena calidad (Home, Catálogo y
Producto están muy cuidados y bien revisados). Los problemas se concentran en
**la disciplina de Git de la fase final** y en **una vista construida fuera del
sistema de diseño**. El repositorio no estaba "roto", pero incumplía varias de
las reglas que el propio equipo se fijó en el README.

---

## 2. Fallos detectados

### 2.1. checkout.html estaba fuera del sistema de diseño (CORREGIDO en este PR)

La vista de checkout se había construido con un enfoque completamente distinto
al del resto del proyecto:

- Cargaba **Tailwind por CDN** (`<script src="cdn.tailwindcss.com">`), justo
  lo que el proyecto prohíbe: aquí Tailwind se compila a `css/styles.css`.
- Usaba **clases genéricas** (`slate-800`, `bg-white`, `max-w-7xl`…) en
  lugar de los **tokens de marca** (`crudo`, `tinta`, `acento`, `.contenedor`,
  `.btn-primario`, `.campo`…).
- Traía una **navbar y un header propios**, en vez de la navbar y el footer
  **canónicos** que deben ser idénticos en las 5 vistas.
- Escribía la marca como "Maison Lumiere", **sin la diéresis** de "Lumière".

**Corrección aplicada:** `checkout.html` se ha reescrito reutilizando el
`<head>`, la navbar y el footer canónicos (idénticos a las otras vistas) y el
sistema de diseño real. Solo el `<main>` es propio: formulario de envío y
contacto, selección de método de pago (visual) y resumen del pedido con
subtotal, IVA y total. Los importes coinciden con `carrito.html` (950,00 € con
IVA), respetando la regla de "los datos se copian, no se inventan".

### 2.2. Push directo a main sin Pull Request

El commit `9610fb7` ("trabajo en equipo") construyó toda la vista del carrito
y entró **directamente a main sin PR ni revisión**, incumpliendo la regla nº 2
("nadie hace push directo a main"). El contenido del carrito en sí sigue el
sistema de diseño y está bien; el problema es de **proceso y trazabilidad**.

### 2.3. El commit del carrito modificó css/styles.css

Ese mismo commit tocó `css/styles.css` (+1 −1), que es un **fichero generado**
y que el README pide expresamente no subir desde las ramas (regla nº 3, la que
"más problemas ha dado"). Recompilar en main con `build.ps1` / `build.sh` es
la única vía correcta de actualizar ese archivo.

### 2.4. PR de checkout mergeado sin review

El **PR #7** (checkout) se **mergeó por su propio autor**, sin descripción, sin
reviewers y **sin ninguna review escrita**. El enunciado exige "Pull Requests
revisados", y un merge así no deja evidencia de que alguien lo mirara. Como
contraste, el **PR #4** (Home) es el ejemplo a seguir: revisión técnica a fondo
y hasta un bug de overflow en móvil detectado.

### 2.5. Mensajes de commit fuera de convención

Mensajes como "trabajo en equipo" o "checkout" no siguen los **Conventional
Commits** en español acordados (`feat(...)`, `fix(...)`, `build(...)`…).

### 2.6. README desactualizado (CORREGIDO en este PR)

La tabla de reparto marcaba el carrito y el checkout como "sin empezar", cuando
en realidad **ambos estaban en main**. El README se autodefine como "el estado
oficial del proyecto", así que la discrepancia era un fallo visible. Se ha
sincronizado la tabla y el checklist con el estado real.

### 2.7. Higiene del repositorio (pendiente, acción manual)

- **Ramas mergeadas sin borrar** (`feat/home`, `feat/catalogo`, `feat/producto`,
  `feature/checkout`, `docs/readme`, `docs/banner-readme`). Conviene borrarlas
  para dejar limpia la lista de ramas. Es una eliminación, así que la decisión
  queda para el equipo.
- **No hay Issues** en el repositorio (ni abiertos ni cerrados).

---

## 3. Qué se ha corregido en este Pull Request

1. `checkout.html` reescrito con el sistema de diseño canónico (ver 2.1).
2. `README.md` sincronizado con el estado real de las vistas (ver 2.6).
3. Este documento (`NOTAS-TECNICAS.md`) con el registro de fallos.

---

## 4. Qué queda pendiente (para el equipo, no automatizable con seguridad)

- **Recompilar `css/styles.css`** en main tras mergear este PR si el nuevo
  checkout usara alguna clase de Tailwind que no estuviera ya en el CSS. Este PR
  **no** toca `css/styles.css` a propósito (regla nº 3).
- **Borrar las ramas** ya mergeadas (acción manual del equipo).
- Para futuros PRs: **dejar siempre una review escrita** antes de mergear y no
  mergear el propio PR sin que otra persona lo mire.

> Nota: no se ha reescrito el historial de Git. Los fallos de proceso ya
> ocurridos (push directo, merge sin review) no se pueden "deshacer" sin
> reescribir la historia del repo, algo arriesgado en un trabajo colaborativo;
> quedan documentados aquí como aprendizaje.
