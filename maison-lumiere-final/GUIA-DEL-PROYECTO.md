# Guía del proyecto — explicada para cualquier persona

Esta guía cuenta **cómo se creó esta tienda online paso a paso**, sin dar
por hecho que sepas programar. Si solo quieres ver el resultado: haz doble
clic en `index.html` y navega; los enlaces funcionan como en una web real.

---

## 1. ¿Qué es esto?

Es el **prototipo de una tienda online** para Maison Lumière, una marca de
moda francesa (ficticia). Un prototipo es una maqueta navegable: enseña el
aspecto y el recorrido de compra para que el cliente lo apruebe **antes**
de construir la tienda de verdad (con pagos reales, base de datos, etc.).

Tiene las 5 pantallas que pidió el cliente, enlazadas entre sí:

1. **Home** (`index.html`) — la portada de la marca.
2. **Catálogo** (`catalogo.html`) — las 20 piezas, con filtros.
3. **Producto** (`producto.html`) — la ficha de un artículo.
4. **Carrito** (`carrito.html`) — lo que llevas, con las cuentas claras.
5. **Checkout** (`checkout.html`) — el pago en 3 pasos.

## 2. ¿De dónde sale? La fusión de dos prototipos

El equipo tenía **dos carpetas** con dos intentos distintos:

- **`maison-lumiere` (v1):** técnicamente impecable (la tecnología pedida,
  buen SEO, repositorio Git), pero solo tenía la portada y usaba dibujos
  grises de relleno en lugar de fotos.
- **`maison-lumiere-v2`:** mucho más bonita (tipografía Archivo, rojo de
  marca, fotos reales en blanco y negro, 4 pantallas), pero construida con
  una tecnología que el encargo **no permite** (JavaScript) y sin checkout.

**La fusión tomó lo mejor de cada una:** el diseño y las fotos de la v2,
reconstruidos sobre la base técnica de la v1, y se creó desde cero la
pantalla de pago que no existía en ninguna. Todo el resultado usa solo las
dos tecnologías permitidas: HTML y Tailwind CSS.

## 3. Las dos tecnologías, en dos frases

- **HTML** es el idioma con el que se escribe el contenido de una página
  web: “esto es un título”, “esto es una foto”, “esto es un botón”. Cada
  pantalla de la tienda es un archivo `.html` que puedes abrir y leer.
- **Tailwind CSS** es la herramienta de estilo: en lugar de escribir hojas
  de estilo aparte, cada etiqueta lleva “apellidos” que describen su
  aspecto. Por ejemplo, `class="bg-crudo text-tinta"` significa “fondo
  crudo, texto color tinta”. Los colores con nombre propio (crudo, tinta,
  acento…) son los colores oficiales de la marca y están definidos una
  sola vez en `src/input.css`.

**Sin JavaScript:** el encargo lo prohíbe, así que los detalles que
parecen interactivos usan trucos nativos de HTML/CSS: el menú del móvil es
un desplegable `<details>`, y el selector de talla pinta de rojo la opción
elegida solo con CSS.

## 4. Qué hay en cada carpeta

| Archivo / carpeta | Qué es |
| --- | --- |
| `index.html`, `catalogo.html`, `producto.html`, `carrito.html`, `checkout.html` | Las 5 pantallas de la tienda |
| `partials/` | La “fuente única” de la barra de navegación y el pie de página, que se copian idénticos en las 5 pantallas |
| `src/input.css` | Los estilos fuente: colores de marca, tipografía y botones, con comentarios que explican cada cosa |
| `css/styles.css` | El resultado “compilado” de lo anterior; es lo que leen los navegadores. No se toca a mano |
| `assets/photos/` | Las fotografías (se muestran en blanco y negro por decisión de diseño) |
| `assets/img/logo.svg` | El monograma ML, usado como icono de pestaña |
| `build.sh` | Un pequeño script que regenera `css/styles.css` cuando se cambian los estilos |
| `server.py` | Opcional: sirve la web en local (viene de la plantilla de 4Geeks) |
| `learn.json` | Ficha técnica de la plantilla académica de 4Geeks |

## 5. Cómo se construyó, paso a paso

1. **Los colores y la letra primero.** Se copiaron los colores exactos del
   diseño v2 (fondo crudo `#f3f2f2`, tinta `#201e1d`, rojo `#ec3013`) y la
   tipografía Archivo a `src/input.css`. Así todas las páginas beben de la
   misma paleta y nada queda “a ojo”.
2. **Navbar y footer canónicos.** Se escribieron una sola vez, en
   `partials/`, y se insertaron idénticos en las 5 páginas. Si mañana hay
   que cambiar un enlace, se cambia en un sitio y se replica.
3. **Página a página.** Home, Catálogo, Producto, Carrito y Checkout,
   siguiendo la lista de requisitos del cliente como checklist (ver §7).
   Los textos, precios y productos vienen del catálogo que ya existía en
   la v2; las 12 piezas nuevas del catálogo se redactaron en el mismo tono.
4. **Compilar los estilos.** Tailwind lee los HTML, ve qué clases se usan
   y genera un `css/styles.css` pequeño y optimizado (unos 27 KB).
5. **Verificación con navegador real.** Se levantó un servidor y se
   capturó cada pantalla en tres tamaños (móvil 390 px, tablet 768 px,
   escritorio 1366 px) para comprobar el responsive, y se revisó que
   ningún enlace ni imagen estuviera roto y que las cuentas del carrito
   cuadraran (420 + 320 + 210 = 950 €; el IVA se desglosa del total).

## 6. ¿Por qué el código está lleno de comentarios?

Todos los archivos llevan notas entre `<!-- ... -->` (HTML) o `/* ... */`
(CSS). Los navegadores las ignoran: son para las personas. Cada página
abre con una cabecera que explica qué es, qué requisitos cumple y cómo
está organizada, y cada sección está rotulada. La intención es que
cualquiera —programe o no— pueda abrir un archivo y entender qué hace
cada bloque.

## 7. La lista del cliente, comprobada punto por punto

**Home**
- ✅ Navbar con logo, buscador y menú de cuenta
- ✅ Hero destacando la campaña de la marca
- ✅ Dos listas horizontales de productos: “Nuevos lanzamientos” y “Más vendidos”
- ✅ Footer con categorías (calzado, camisas, pantalones, accesorios), legal (términos, privacidad, sobre la marca) y contacto
- ✅ Navbar y footer reutilizados idénticos en todas las vistas

**Catálogo**
- ✅ Mantiene navbar y footer
- ✅ Barra de filtros antes del listado: por categoría y por talla
- ✅ Cuadrícula 4×5 con 20 productos visibles

**Producto**
- ✅ Dos columnas: foto a la izquierda (≈ mitad del ancho), información a la derecha
- ✅ Nombre, código de referencia (ML-CAL-001), talla, precio, selector de cantidad y botón “Añadir al carrito”
- ✅ Sección inferior con materiales y usos/escenarios recomendados

**Carrito**
- ✅ Vista completa (no panel lateral) con 3 productos de ejemplo
- ✅ Cada línea: miniatura, precio unitario, cantidad y total por producto
- ✅ Caja resumen: subtotal, impuestos (IVA 21 %), total y botón “Tramitar el pedido”

**Checkout**
- ✅ Flujo en 3 pasos: datos personales → dirección de envío → pago con tarjeta

**Requisitos generales**
- ✅ Solo HTML + Tailwind CSS (cero JavaScript, cero React)
- ✅ SEO: estructura semántica, títulos/descripciones únicos, Schema.org (Organization, WebSite, ItemList, Product, BreadcrumbList), noindex en páginas privadas
- ✅ Diseño moderno y consistente (sistema de diseño único para todo)
- ✅ Responsive: móvil, tablet y escritorio
- ✅ 5 archivos HTML enlazados entre sí + estilos compartidos

## 8. Qué es Git y cómo lo usó el equipo

**Git** es el historial de cambios del proyecto: guarda “fotografías”
(commits) de cada avance, con autor, fecha y explicación. Permite que
varias personas trabajen a la vez sin pisarse.

El equipo siguió el flujo profesional que evalúa 4Geeks:

- La rama **`main`** es la versión “buena” del proyecto.
- Cada funcionalidad se hizo en su propia **rama `feature/…`** (una para el
  sistema de diseño, una para la home, otra para el catálogo…). Una rama
  es como un borrador paralelo que no toca la versión buena.
- Al terminar, cada rama se **fusionó (merge)** en `main`. En GitHub, ese
  paso es el famoso **Pull Request**: el compañero revisa el cambio y lo
  aprueba antes de integrarlo.
- Los mensajes de commit siguen una convención profesional
  (*Conventional Commits*): `feat:` para funcionalidades nuevas, `chore:`
  para tareas de mantenimiento, `build:` para la compilación, `docs:`
  para documentación.

Para ver la historia completa con su dibujo de ramas:

```bash
git log --oneline --graph --all
```

## 9. Cómo publicarlo en GitHub (entrega de 4Geeks)

1. Entra en github.com y crea un repositorio nuevo y vacío (por ejemplo
   `maison-lumiere-store`).
2. Abre una terminal en esta carpeta y conecta el repositorio:
   ```bash
   git remote add origin https://github.com/TU-USUARIO/maison-lumiere-store.git
   ```
3. Sube la rama principal y el resto de ramas:
   ```bash
   git push -u origin main
   git push origin --all
   ```
4. Comparte el enlace del repositorio según las instrucciones de tu
   instructor.

## 10. Glosario mínimo

- **Prototipo:** maqueta navegable de una web, sin la “maquinaria” interna.
- **HTML:** lenguaje que describe el contenido de una página.
- **CSS / Tailwind:** cómo se ve ese contenido (colores, tamaños, rejillas).
- **Responsive:** que se adapta a móvil, tablet y escritorio.
- **SEO:** técnicas para que Google entienda y muestre bien la web.
- **Schema.org / JSON-LD:** fichas de datos invisibles que leen los buscadores.
- **Commit:** fotografía de un avance del proyecto en Git.
- **Rama (branch):** borrador paralelo para trabajar sin romper lo bueno.
- **Merge / Pull Request:** incorporar un borrador a la versión buena, con revisión.
- **Compilar:** generar el archivo final optimizado a partir de la fuente.
