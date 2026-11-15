# Handoff — Manual de gramática del español

Última actualización: 2026-11-15.

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
| Capítulos 1-15 | `capitulos/capNN.tex` | pendientes, se cargan de a uno |
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
- Numeración de secciones con punto final (2.1.), como en los originales.
- Tablas numeradas por capítulo sin prefijo («Tabla 1»).
- Glosario general a dos columnas; glosarios de capítulo a una.

## Pendientes y dudas

- Citas: el formato APA da «Saussure (1916/1945)»; los originales usan
  «1945 [1916]». Definir si se adapta.
- Entradas `REVISAR` del .bib: Vendler 1967 (¿1957?), Rizzi 1995 (¿1997?),
  Bosque 1989/1990, García Negroni 2016 (autoría), DOI de Bosque 2018,
  páginas de Ullman 2006, inicial de Munguía, enlace de Marcovecchio y
  Kaller 2010, autores del libro en Olarrea 2011.
- El cap. 15 no tiene lista de referencias en el .docx de bibliografía.
