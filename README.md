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

| Vista | Archivo | Responsable | Rama |
| --- | --- | --- | --- |
| Sistema de diseño, navbar y footer | `src/`, `partials/` | Francesco | *(ya en `main`)* |
| 1 · Home | `index.html` | Diego Reynoso | `feat/home` |
| 2 · Catálogo | `catalogo.html` | Diego Fuentes | `feat/catalogo` |
| 3 · Vista de producto | `producto.html` | *Por asignar* | `feat/producto` |
| 4 · Carrito | `carrito.html` | *Por asignar* | `feat/carrito` |
| 5 · Checkout | `checkout.html` | *Por asignar* | `feat/checkout` |

Quedan tres vistas por repartir entre **Francesco, Inés y Jesús**.

## Estado actual

En `main` está la **base común**, ya terminada:

- El **sistema de diseño** completo: colores de marca, tipografía y componentes.
- La **navbar y el footer canónicos**, ya insertados e idénticos en las 5 vistas.
- Las **5 páginas creadas y enlazadas entre sí**, con su `<head>` de SEO propio
  (título, descripción, Open Graph y Schema.org).
- Las **fotografías** de la marca en `assets/photos/`.

Lo que falta es el **contenido de cada vista**: el `<main>` de cada página está
vacío a propósito, con la lista de requisitos dentro en un comentario.

---

## Cómo trabajar (importante, leer antes de tocar nada)

### Las tres reglas

1. **Cada persona toca SOLO el `<main>` de su archivo.** El `<head>`, la navbar y
   el footer son comunes a las 5 vistas y deben quedar idénticos. Si hay que
   cambiar algo de eso, se habla en el grupo y se cambia **en las 5 a la vez**.
2. **Nadie hace push directo a `main`.** Todo entra por Pull Request, revisado
   por otra persona del equipo.
3. **`css/styles.css` es un archivo generado.** Si da conflicto en un merge,
   **no se arregla a mano jamás**: se acepta cualquiera de las dos versiones,
   se recompila (`.\build.ps1`) y se commitea el resultado.

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

# 4. Trabajar, con commits pequeños y frecuentes
git add catalogo.html
git commit -m "feat(catalogo): barra de filtros por categoría y talla"

# 5. Subir tu rama
git push -u origin feat/catalogo

# 6. Abrir el Pull Request en GitHub y pedir revisión a alguien del equipo
```

### Mensajes de commit

Convención *Conventional Commits*, en español y en presente:

| Prefijo | Cuándo | Ejemplo |
| --- | --- | --- |
| `feat:` | funcionalidad nueva | `feat(carrito): resumen con subtotal, IVA y total` |
| `fix:` | corregir algo roto | `fix(home): el enlace del logo apuntaba a la ruta antigua` |
| `style:` | solo aspecto visual | `style(catalogo): más aire entre las cards` |
| `build:` | recompilar el CSS | `build(css): recompilar tras añadir la rejilla` |
| `docs:` | documentación | `docs: repartir las vistas pendientes` |

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
- [ ] Contenido de las 5 vistas según los requisitos del cliente
- [ ] Responsive verificado en móvil (390 px), tablet (768 px) y escritorio (1366 px)
- [ ] Git: una rama por persona, commits repartidos y Pull Requests revisados

---

## Créditos

Equipo: **Diego Reynoso, Diego Fuentes, Francesco, Inés y Jesús** — 4Geeks Academy.

El sistema de diseño, la navbar, el footer y la dirección de arte los desarrolló
**Francesco**; el prototipo completo del que salen está guardado como referencia
para consultar cómo resolvió cada vista.

Plantilla base: [`html-hello`](https://github.com/4GeeksAcademy/html-hello).
Marca, productos, precios y datos de contacto son ficticios.
