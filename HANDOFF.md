# Handoff — Manual de gramática del español

Última actualización: 2026-11-15 (capítulo 2).

## Objetivo

Libro en dos salidas: PDF (LaTeX, este repo) y versión online (Read the Docs,
Quarto o Jupyter Book; a definir después de cargar los capítulos). Fuentes
originales: los .docx normalizados del proyecto de Claude «LIBRO ONLINE».

## Estado

| Parte | Archivo | Estado |
|---|---|---|
| Diseño y entornos | `config/paquetes.tex`, `config/estilo.tex` | listo |
| Bibliografía (caps. 1-14) | `bib/referencias.bib` | convertida; entradas `REVISAR` pendientes |
| Portada | `preliminares/portada.tex` | faltan título definitivo y responsables |
| Prólogo | `preliminares/prologo.tex` | pendiente (Prólogo.docx) |
| Siglario | `preliminares/siglario.tex` | pendiente (02-siglario.docx) |
| Capítulo 1 | `capitulos/cap01.tex` | cargado; faltan 4 imágenes y revisar marcas `\pendiente` |
| Capítulo 2 | `capitulos/cap02.tex` | cargado; revisar marcas `\pendiente` |
| Capítulos 3-15 | `capitulos/capNN.tex` | pendientes, se cargan de a uno |
| Glosario general | `finales/glosario.tex` | estructura a dos columnas; contenido pendiente (18-glosario.docx) |
| Versión online | — | no empezada |

## Flujo por capítulo

1. Convertir `Capitulo_NN_normalizado.docx` a `capitulos/capNN.tex` con la plantilla.
2. Ejemplos del texto con `exe` fuera de ejercicios; ítems de ejercicios con
   `exe` dentro de `ejercicio` (numeración sin paréntesis, reinicia).
3. Verificar que todas las obras citadas tengan `capNN` en `keywords`; agregar
   `lectNN` para las lecturas recomendadas (y crear las entradas que falten).
4. Descomentar `\include{capitulos/capNN}` en `main.tex`.
5. Compilar con LuaLaTeX y XeLaTeX sin errores ni cajas desbordadas.
6. Un commit por capítulo: `Capítulo NN: <título>`.

## Decisiones tomadas

- Clase `scrbook`, 170 × 240 mm, Libertinus Serif/Sans, color de acento petróleo.
- Ejemplos con gb4e parcheado: contador `exx` por capítulo con «(n)»; contador
  `ejx` por ejercicio con «n.».
- biblatex-apa con ajustes para el español: «y», sin coma antes de «y» con dos
  autores, «Obra original publicada en», «Saussure, F. de», (Vol., pp.),
  Coord./Dir./Comp.
- Referencias por capítulo según las listas de los autores (palabras clave del
  .bib), no según lo citado.
- Secciones numeradas sin el número de capítulo y con punto final (2.1.,
  2.3.1.), como en los originales.
- Ejercicios en cuerpo menor y con 6 mm antes y después (pedido en los
  comentarios del cap. 1).
- Figuras sin imagen todavía: `\figurapendiente{epígrafe}{etiqueta}`; las
  imágenes van en `figuras/capNN/`.
- Dudas del original marcadas en el PDF con `\pendiente{...}` (texto rojo).
- Tablas numeradas por capítulo sin prefijo («Tabla 1»).
- Glosario general a dos columnas; glosarios de capítulo a una.

## Pendientes y dudas

### Capítulo 1
- Imágenes: fig. 1 (Donatela, Raznovich), fig. 2 (metáfora del conmutador),
  fig. 4 (lectura hipertextual), fig. 5 (viñeta de Colón). Las figs. 3 y 6 se
  rehicieron en TikZ.
- Nota «lectos» sin texto en el original.
- Jakobson (1984) citado, pero no está en la bibliografía del capítulo.
- §3.1: el ejemplo dice *vivía*; el comentario, *vive*.
- §4.2.1: «rasgos ‘masculino’ y ‘singular’» de *viajeros* (debería ser plural).
- Tabla 1: epígrafe repetido («personas gramaticales y las personas gramaticales»).
- Ej. (6b): falta el dominio del enlace; ej. (11b): fecha confusa.
- Se eliminó el párrafo duplicado de la cita de Bosque y Gutiérrez-Rexach
  (2009, p. 13): quedó solo en el recuadro.
- Las referencias del texto van con biblatex (formato APA: «Saussure (1916/1945)»).

### Capítulo 2
- §4: la cita larga sobre aceptabilidad se atribuye a Chomsky 1974a [1957],
  pp. 6-7, pero el texto la presenta como de *Aspectos* (1970 [1965]).
- §5 remite a «la cita de Chomsky (§3)»; la cita está en §4.
- §5.3: el texto remitía a (15a), (15b) y (16); con las etiquetas, las
  remisiones apuntan a los ejemplos correctos (16a), (16b) y (17).
- Ej. 7, resuelto: la paráfrasis menciona «escultura de porcelana», pero el
  ítem 1 no dice «de porcelana».
- Solucionario ej. 1: falta la fila «remite al uso lingüístico de ciertos
  grupos sociales».
- Solucionario ej. 4 a): la respuesta trata 4a/4b, pero la consigna pregunta
  por 3a/3b.
- Ej. (18b): «versión de L. Carreter» → se puso F. Lázaro Carreter.
- Corregido: «(2a)-(1b)» → «2a-2b» en el solucionario del ej. 3.
- En ejercicios y solucionarios, las remisiones a ítems van sin paréntesis
  (1a, 3b), coherente con la numeración de ejercicios.

### General

- Citas: el formato APA da «Saussure (1916/1945)»; los originales usan
  «1945 [1916]». Definir si se adapta.
- Entradas `REVISAR` del .bib: Vendler 1967 (¿1957?), Rizzi 1995 (¿1997?),
  Bosque 1989/1990, García Negroni 2016 (autoría), DOI de Bosque 2018,
  páginas de Ullman 2006, inicial de Munguía, enlace de Marcovecchio y
  Kaller 2010, autores del libro en Olarrea 2011.
- El cap. 15 no tiene lista de referencias en el .docx de bibliografía.
