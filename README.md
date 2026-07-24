<p align="center">
  <img src="assets/img/banner-maison-lumiere.jpg"
       alt="Maison Lumière — prototipo de e-commerce premium de calzado. Proyecto académico del bootcamp de AI Engineering de 4Geeks Academy."
       width="100%">
</p>

# Maison Lumière · Prototipo de tienda online

Prototipo visual y funcional de la tienda online de **Maison Lumière**, una marca
francesa de moda (cliente ficticio). Proyecto del bootcamp de 4Geeks Academy —
*«Mi primer proyecto profesional colaborativo»*.

> ### ⚠️ Alcance del encargo: **solo HTML + Tailwind CSS**
> Sin JavaScript, sin frameworks, nada de React. Lo que parece interactivo se
> resuelve con HTML y CSS nativos: el menú móvil es un `<details>`, los filtros
> son un `<form>` de verdad y la opción seleccionada se pinta con `:has()`.
> **Díselo a tu IA copiloto desde el primer mensaje.**

---

## El equipo y el reparto

| Vista | Archivo | Responsable | Rama | Estado |
| --- | --- | --- | --- | --- |
| Sistema de diseño, navbar y footer | `src/`, `partials/` | Franchesco | — | ✅ en `main` |
| 1 · Home | `index.html` | Diego Reynoso | `feat/home` | ✅ en `main` (PR #4) |
| 2 · Catálogo | `catalogo.html` | Diego Fuentes | `feat/catalogo` | ✅ en `main` (PR #5) |
| 3 · Vista de producto | `producto.html` | Franchesco | `feat/producto` | ✅ en `main` (PR #3) |
| 4 · Carrito | `carrito.html` | Inés | `feat/carrito` | ✅ en `main` ⚠️ push directo, ver `NOTAS-TECNICAS.md` |
| 5 · Checkout | `checkout.html` | Jesús | `feat/checkout` | ✅ en `main` (PR #7, reescrito → sistema de diseño) |

> Esta tabla es el estado oficial del proyecto. Se actualiza después de cada
> merge a `main` (ver [Mantenimiento del README](#mantenimiento-del-readme)).

La **base común** ya está terminada en `main`: sistema de diseño, navbar y footer
canónicos idénticos en las 5 vistas, las 5 páginas creadas y enlazadas con su
`<head>` de SEO propio, y las fotografías en `assets/photos/`.

---

## Cómo trabajar (importante, leer antes de tocar nada)

### Las cinco reglas

1. **Cada persona toca SOLO el `<main>` de su archivo.** El `<head>`, la navbar y
   el footer son comunes a las 5 vistas y deben quedar idénticos. Si hay que
   cambiar algo de eso, se habla en el grupo y se cambia **en las 5 a la vez**.

2. **Nadie hace push directo a `main`.** Todo entra por Pull Request, revisado
   por otra persona del equipo. *Única excepción:* los commits `build(css)` de
   recompilación (ver regla 3), porque el contenido de ese fichero no lo decide
   nadie, lo escribe Tailwind.

3. **NO subas `css/styles.css` desde tu rama.** ⚠️ Es la regla que más problemas
   nos ha dado.

   Ese fichero lo genera Tailwind. Si dos personas lo suben desde sus ramas,
   GitHub se encuentra dos versiones distintas del mismo archivo generado y da
   conflicto. Nos pasó con la home y el catálogo.

   - Trabaja con `.\build.ps1 watch` en una terminal, como siempre. Eso no cambia.
   - Al commitear, **nombra tus archivos uno a uno**:
     `git add catalogo.html` ✅ — nunca `git add .` ❌
   - Antes de cada `push`, un `git status` para confirmar que `css/styles.css`
     no está en verde.

   **Después de mergear un PR**, quien le dé al botón recompila en `main`:

   ```powershell
   git checkout main
   git pull
   .\build.ps1
   git add css/styles.css
   git commit -m "build(css): recompilar tras mergear <lo que sea>"
   git push
   ```

   Este paso **no es opcional**: entre el merge y ese push, la vista recién
   mergeada se ve sin estilos para todo el mundo. Ya nos pasó una vez con el
   catálogo: faltaban 39 clases y el filtro de talla directamente no aparecía.

4. **Los datos de producto (nombres y precios) se copian, no se inventan.** Si
   una pieza ya sale en otra vista, usa exactamente el mismo nombre y el mismo
   precio. No hay base de datos: la fuente de verdad es lo que ya esté en `main`,
   y en concreto **`producto.html` manda en los precios** (ahí el precio aparece
   en cinco sitios: título, meta descripción, Schema.org, precio visible y botón).

   Nos pasó con cuatro productos que costaban distinto según la página.

5. **El README lo mantiene Diego Fuentes.** No lo edites desde tu rama de
   feature: tiene el mismo problema que el CSS, si dos personas tocan la tabla
   a la vez hay conflicto. Si algo está mal o falta, dilo por el grupo.

### Pasos

```bash
# 1. Clonar (solo la primera vez)
git clone https://github.com/4GeeksAcademy/Proyecto-Profesional-Colaborativo-Ines-Jesus-DiegoF-Franchesco-DiegoR.git
cd Proyecto-Profesional-Colaborativo-Ines-Jesus-DiegoF-Franchesco-DiegoR

# 2. Partir siempre de un main actualizado
git checkout main
git pull

# 3. Crear tu rama
git checkout -b feat/catalogo      # <- la tuya, según la tabla de arriba

# 4. Trabajar, con commits pequeños y frecuentes.
#    Nombra tus archivos uno a uno: NUNCA "git add ." (colaría styles.css)
git add catalogo.html
git commit -m "feat(catalogo): barra de filtros por categoría y talla"

# 5. Comprobar que no se cuela el CSS antes de subir
git status          # css/styles.css debe salir modificado pero SIN preparar

# 6. Subir tu rama
git push -u origin feat/catalogo

# 7. Abrir el Pull Request en GitHub y pedir revisión a alguien del equipo

# 8. YA MERGEADO: quien pulsa el botón recompila el CSS en main (regla 3)
git checkout main && git pull
.\build.ps1
git add css/styles.css
git commit -m "build(css): recompilar tras mergear el catálogo"
git push
```

> **Deja una review escrita al aprobar un PR**, aunque sea una línea. El
> enunciado pide *«Pull Requests revisados»*, y un merge sin review no deja
> ninguna evidencia de que alguien lo mirara.

### Mensajes de commit

Convención *Conventional Commits*, en español y en presente:

| Prefijo | Cuándo | Ejemplo |
| --- | --- | --- |
| `feat:` | funcionalidad nueva | `feat(carrito): resumen con subtotal, IVA y total` |
| `fix:` | corregir algo roto | `fix(home): el enlace del logo apuntaba a la ruta antigua` |
| `style:` | solo aspecto visual | `style(catalogo): más aire entre las cards` |
| `build:` | recompilar el CSS | `build(css): recompilar tras añadir la rejilla` |
| `docs:` | documentación | `docs: repartir las vistas pendientes` |

### Mantenimiento del README

Lo mantiene **Diego Fuentes** (regla 5). Se actualiza **después de cada merge a
`main`**, en su propia rama para no mezclarlo con el trabajo de las vistas:

```powershell
git checkout main && git pull
git checkout -b docs/readme
# editar README.md
git add README.md
git commit -m "docs: actualizar estado tras mergear la home"
git push -u origin docs/readme
```

Qué revisar cada vez:

1. **La tabla de reparto** — ¿alguna vista cambió de estado?
2. **El checklist de evaluación** del final — ¿ya se puede marcar algo?
3. **¿Ha salido alguna norma nueva** en el grupo que convenga dejar escrita?

---

## Cómo ver el prototipo

Doble clic en `index.html` funciona, pero lo recomendable es levantar un servidor
local (así las rutas se comportan como en la web real):

```bash
python -m http.server 8080      # y abre http://localhost:8080
```

## Cómo compilar el CSS

Tailwind **no está por CDN**: se compila. Lee `src/input.css`, escanea los `.html`
del proyecto y genera `css/styles.css` con solo el CSS que se usa.

```powershell
.\build.ps1              # Windows — compila una vez
.\build.ps1 watch        # Windows — recompila sola mientras editas
```

```bash
sh build.sh              # Mac / Linux — compila una vez
sh build.sh watch        # Mac / Linux — recompila sola mientras editas
```

La primera vez descarga el binario oficial de Tailwind (~110 MB) en `bin/`, que
está ignorada por Git. Después ya no lo vuelve a descargar.

> **Esta es la trampa nº 1 del proyecto.** Si escribes una clase de Tailwind que
> no estuviera ya en el proyecto y **no recompilas**, esa clase simplemente no
> existe en el CSS y no verás ningún error: la página se ve mal y no sabes por
> qué. Deja `.\build.ps1 watch` corriendo en una terminal mientras trabajas.

---

## Sistema de diseño

Todo está definido en [`src/input.css`](src/input.css), comentado línea a línea.

**Colores de marca** (se usan como `bg-`, `text-`, `border-`):

| Token | Color | Para qué |
| --- | --- | --- |
| `crudo` | `#f3f2f2` | fondo general |
| `superficie` | `#eae9e9` | fondos de fotos y campos |
| `tinta` | `#201e1d` | texto principal |
| `acento` | `#ec3013` | rojo de marca, titulares y detalles grandes |
| `acento-fuerte` | `#dd2b0f` | fondo de botones |
| `acento-oscuro` | `#ae1800` | texto pequeño en rojo (accesible) |
| `acento-claro` | `#fff2ef` | fondo de etiquetas «Nuevo» |
| `acento-noche` | `#7c1405` | texto sobre `acento-claro` |
| `humo` / `grafito` | `#f8f4f4` / `#444141` | neutros de apoyo |

**Componentes reutilizables** (no reinventes ninguno, ya están hechos):

| Clase | Qué es |
| --- | --- |
| `.contenedor` | ancho máximo 1200 px + márgenes laterales fluidos |
| `.etiqueta-seccion` | la «ceja» roja en mayúsculas que abre cada bloque |
| `.separador` | línea divisoria gruesa del diseño |
| `.btn` + `.btn-primario` / `.btn-secundario` / `.btn-fantasma` | los tres niveles de botón |
| `.etiqueta-campo` + `.campo` | etiqueta y campo de formulario |
| `.segmento` + `.segmento-opcion` | selector tipo pestañas para filtros y tallas, **sin JavaScript** |
| `.etiqueta` + `.etiqueta-roja` / `.etiqueta-neutra` | distintivos de producto |
| `.foto-bn` | foto en blanco y negro, la firma visual de la marca |

**Tipografía:** Archivo (Google Fonts), ya enlazada en las 5 páginas.

**Fotos disponibles** en `assets/photos/`: `alpine`, `atelier`, `camisas-cat`,
`cinturon`, `derby`, `hero`, `lino`, `mocasin`, `oxford`, `vaquero`, `vendome`.

---

## Estructura del repositorio

```
├── index.html          Vista 1 · Home
├── catalogo.html       Vista 2 · Catálogo
├── producto.html       Vista 3 · Ficha de producto
├── carrito.html        Vista 4 · Carrito
├── checkout.html       Vista 5 · Checkout
├── partials/           Navbar y footer canónicos (la fuente única)
├── src/input.css       Estilos fuente: colores, tipografía y componentes
├── css/styles.css      CSS compilado — GENERADO, no editar a mano
├── assets/photos/      Fotografías de la marca
├── assets/img/         Logo / favicon
├── build.ps1           Compilador de Tailwind (Windows)
├── build.sh            Compilador de Tailwind (Mac / Linux)
└── server.py           Servidor local opcional (plantilla de 4Geeks)
```

`partials/navbar.html` y `partials/footer.html` **no se sirven al navegador**:
son la referencia. HTML puro no tiene componentes, así que ese código está
copiado en las 5 páginas. Si cambia, se cambia en el partial y se replica.

---

## Qué se evalúa (checklist del enunciado)

- [x] 5 archivos HTML, uno por vista, **enlazados entre sí**
- [x] Navbar y footer reutilizados e idénticos en todas las vistas
- [x] Estilos compartidos (Tailwind + `src/input.css`)
- [x] SEO: HTML semántico, `title` y `meta description` únicos, Schema.org
- [x] Contenido de las 5 vistas según los requisitos del cliente — **5 de 5**
      (todas en `main`; checkout reescrito para usar el sistema de diseño)
- [ ] Responsive verificado en móvil (390 px), tablet (768 px) y escritorio (1366 px)
      — hecho en catálogo, producto y home; falta comprobar carrito y checkout
- [ ] Git: una rama por persona, commits repartidos y Pull Requests revisados
      — ojo, hay PRs mergeados **sin review escrita** y un push directo a `main`
      (carrito). Todos los fallos están documentados en `NOTAS-TECNICAS.md`

---

## Créditos

Equipo: **Diego Reynoso, Diego Fuentes, Franchesco, Inés y Jesús** — 4Geeks Academy.

El sistema de diseño, la navbar, el footer y la dirección de arte los desarrolló
**Franchesco**; el prototipo completo del que salen está guardado como referencia
para consultar cómo resolvió cada vista.

Plantilla base: [`html-hello`](https://github.com/4GeeksAcademy/html-hello).
Marca, productos, precios y datos de contacto son ficticios.
