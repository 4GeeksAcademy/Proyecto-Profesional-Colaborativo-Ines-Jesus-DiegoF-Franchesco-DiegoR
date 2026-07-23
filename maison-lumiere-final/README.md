# Maison Lumière · Prototipo de tienda online

Prototipo visual y funcional de la futura tienda online de **Maison Lumière**,
una marca francesa de moda (cliente ficticio del proyecto académico
*“Mi primer proyecto profesional colaborativo”* de 4Geeks Academy).

Este repositorio es la **fusión de los dos prototipos** que preparó el equipo:

| Origen | Qué aportó |
| --- | --- |
| `maison-lumiere` (v1) | La base técnica: Tailwind CSS con build propio, HTML semántico, SEO con Schema.org y el flujo de trabajo con Git |
| `maison-lumiere-v2` | El diseño final “Modernist”: tipografía Archivo, rojo de marca, fotos reales en blanco y negro y la dirección de arte |

> ⚠️ Alcance pactado con el cliente: **solo HTML + Tailwind CSS**.
> Sin JavaScript, sin frameworks (nada de React). Los detalles interactivos
> (menú móvil, filtros, tallas) se resuelven con HTML y CSS nativos.

---

## Las 5 vistas (todas enlazadas entre sí)

| Vista | Archivo | Contenido |
| --- | --- | --- |
| Home | `index.html` | Navbar con logo/buscador/cuenta, hero de campaña, cifras, categorías, **dos listas horizontales** (Nuevos lanzamientos y Más vendidos), editorial y newsletter |
| Catálogo | `catalogo.html` | Barra de **filtros por categoría y talla** + cuadrícula **4×5 con 20 productos** |
| Producto | `producto.html` | Ficha a **dos columnas**: foto / nombre, referencia, talla, precio, cantidad y “Añadir al carrito”; debajo, materiales y usos recomendados |
| Carrito | `carrito.html` | **3 productos de ejemplo** con miniatura, precio unitario, cantidad y total por línea + resumen con subtotal, IVA, total y botón de compra |
| Checkout | `checkout.html` | Formulario de pago en **3 pasos**: datos personales → dirección de envío → tarjeta |

La navbar y el footer son **idénticos en las 5 vistas**: la fuente única está
en `partials/navbar.html` y `partials/footer.html`.

## Cómo ver el prototipo

Opción rápida: abre `index.html` con doble clic en cualquier navegador.

Opción recomendada (con servidor local):

```bash
python3 -m http.server 8080
# y visita http://localhost:8080
```

## Cómo editar los estilos

Los estilos fuente viven en `src/input.css` (colores de marca, tipografía y
componentes). Tras cualquier cambio, recompila:

```bash
sh build.sh          # compila una vez (descarga Tailwind la primera vez)
sh build.sh watch    # recompila al vuelo mientras editas
```

El resultado es `css/styles.css`, que es lo que enlazan las páginas.
Ese archivo compilado **sí se versiona**, para que el prototipo funcione
nada más clonar el repositorio.

## Estructura del proyecto

```
maison-lumiere-final/
├── index.html            Vista 1 · Home
├── catalogo.html         Vista 2 · Catálogo (filtros + 4×5)
├── producto.html         Vista 3 · Ficha de producto
├── carrito.html          Vista 4 · Carrito (3 productos)
├── checkout.html         Vista 5 · Pago en 3 pasos
├── partials/             Navbar y footer canónicos (fuente única)
├── src/input.css         Estilos fuente (tokens de marca + componentes)
├── css/styles.css        CSS compilado por Tailwind (no editar a mano)
├── assets/photos/        Fotografías de la marca
├── assets/img/logo.svg   Monograma ML (favicon)
├── build.sh              Compilador de Tailwind (sin instalar nada)
├── server.py             Servidor local opcional (plantilla 4Geeks)
├── GUIA-DEL-PROYECTO.md  Cómo se creó, explicado para cualquier persona
└── README.md             Este archivo
```

## SEO y accesibilidad aplicados

- HTML semántico en todas las vistas: `header`, `nav`, `main`, `section`,
  `article`, `aside`, `footer`, `address`, `fieldset/legend`.
- `title` y `meta description` únicos por página; Open Graph para compartir.
- Datos estructurados **Schema.org (JSON-LD)**: `Organization` en todas las
  vistas, `WebSite + SearchAction` en la home, `ItemList` en el catálogo y
  `Product + Offer + BreadcrumbList` en la ficha de producto.
- Carrito y checkout con `noindex` (páginas privadas del usuario).
- Accesibilidad: enlace “saltar al contenido”, etiquetas en todos los campos,
  `aria-current` en la página activa, foco visible, textos alternativos.
- Responsive real: móvil (listas deslizables, menú `details`), tablet y
  escritorio, verificado a 390 px, 768 px y 1366 px.

## Flujo de trabajo con Git (Skill 5)

Trabajo en equipo simulando el flujo profesional:

- Rama `main` protegida + **una rama `feature/` por funcionalidad**
  (`feature/sistema-diseno`, `feature/home`, `feature/catalogo`…).
- Commits pequeños con la convención *Conventional Commits*
  (`feat:`, `chore:`, `build:`, `docs:`).
- Cada rama se integró en `main` con un **merge sin fast-forward**, que en
  GitHub equivaldría a un Pull Request revisado por el compañero de equipo.
- Historia completa: `git log --oneline --graph --all`

### Publicar en GitHub (pasos del enunciado)

```bash
# 1. Crea un repositorio vacío en tu cuenta de GitHub
# 2. Conecta este proyecto con tu repositorio:
git remote add origin https://github.com/TU-USUARIO/TU-REPO.git
# 3. Sube todo (ramas incluidas):
git push -u origin main --follow-tags
git push origin --all
```

## Créditos

Proyecto académico del bootcamp de **4Geeks Academy** — plantilla base
[`html-hello`](https://github.com/4GeeksAcademy/html-hello).
Equipo: Franchesco Stabile y compañero/a de proyecto, con IA como copiloto.
Marca, productos, precios y datos de contacto son ficticios.
Fotografías: material de muestra del equipo para el prototipo.
