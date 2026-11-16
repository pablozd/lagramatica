# Handoff — Manual de gramática del español

Última actualización: 2026-11-15 (capítulo 3).

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
| Capítulo 3 | `capitulos/cap03.tex` | cargado; faltan imágenes, audios y la letra de la canción |
| Capítulo 4 | `capitulos/cap04.tex` | cargado; faltan imágenes, el texto de *El País* y la letra de la canción |
| Capítulo 5 | `capitulos/cap05.tex` | cargado; faltan textos de Bioy Casares, Litvin, Saki, Cortázar y *La naturaleza* |
| Capítulo 6 | `capitulos/cap06.tex` | cargado; faltan los textos de Peyrou y Asimov |
| Capítulos 7-15 | `capitulos/capNN.tex` | pendientes, se cargan de a uno |
| Glosario | `finales/glosario.tex` | único, alfabético, a dos columnas (18-glosario.docx + términos de los caps. 4, 5 y 6) |
| Bibliografía final | `\bibliografiageneral` en `main.tex` | única, al final del libro |
| Versión online | — | no empezada |

## Flujo por capítulo

1. Convertir `Capitulo_NN_normalizado.docx` a `capitulos/capNN.tex` con la plantilla.
2. Ejemplos del texto con `exe` fuera de ejercicios; ítems de ejercicios con
   `exe` dentro de `ejercicio` (numeración sin paréntesis, reinicia).
3. Verificar que todas las obras citadas tengan `capNN` en `keywords`; agregar
   `lectNN` para las lecturas recomendadas (y crear las entradas que falten;
   `nobib` si duplica otra entrada).
3b. Agregar a `finales/glosario.tex` solo los términos que falten, en orden
   alfabético. El capítulo no lleva glosario ni referencias propias.
3c. Pasar a `\ref` las remisiones de capítulos anteriores a secciones del nuevo.
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
- Bibliografía única al final del libro (`\bibliografiageneral`): entra toda
  obra citada en el texto o con `capNN`/`lectNN` de un capítulo incluido;
  `nobib` la excluye. Las lecturas recomendadas siguen al final de cada capítulo.
- Secciones numeradas con el número de capítulo y sin punto final (2.1,
  2.3.1), a pedido del autor (opción `es-nosectiondot` de babel).
- Enlaces en color (`colorlinks`): remisiones, citas, notas, URL e índice.
- Remisiones a otros capítulos con `\capref{N}` / `\Capref{N}`: enlazan si
  el capítulo ya está incluido; si no, texto plano. Las remisiones a
  secciones de otro capítulo («capítulo 4: §7.3») siguen como texto y deben
  pasar a `\ref` (con la numeración nueva: §4.7.3) al cargar ese capítulo.
- Transcripciones: `\fon{...}` = [ ], `\fonol{...}` = / /.
- Dentro de un ejercicio, cada bloque `exe` reinicia la numeración.
- Textos protegidos completos (letras de canciones, cuentos enteros) no se
  transcriben: quedan con `\textoaincorporar{...}` para pegarlos a mano.
- Ejercicios en cuerpo menor y con 6 mm antes y después (pedido en los
  comentarios del cap. 1).
- Figuras sin imagen todavía: `\figurapendiente{epígrafe}{etiqueta}`; las
  imágenes van en `figuras/capNN/`.
- Dudas del original marcadas en el PDF con `\pendiente{...}` (texto rojo).
- Tablas numeradas por capítulo sin prefijo («Tabla 1»).
- Un solo glosario, al final, a dos columnas, sin términos repetidos.

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

### Capítulo 3
- Letra de *El viento* (Manu Chao): incorporar a mano en el ej. 1.
- Figuras 1 y 2 (aparato fonatorio, salida oral/nasal): no están en el
  original. Figs. 3-8 son imágenes pendientes (las tablas del AFI se pueden
  rehacer en TikZ). La fig. 9 (sílaba) se rehízo con forest.
- Imágenes de los ejercicios 2, 18 y 25; audios de los ejercicios 15 y 16;
  enlace al video del ejercicio 17.
- Hualde (2013) se cita en el texto; en la bibliografía figura 2014.
- Kouti (2010), citado en el solucionario del ej. 19, no está en la bibliografía.
- Ej. (1) de §10: se corrigieron acento y vibrantes de las transcripciones.
- Solucionario ej. 1: se cambió [ç] por [x] (*gema*, *g* ante e/i).
- Solucionario ej. 6e: [ɛ] figuraba como «redondeada».
- Solucionario ej. 6f: *tejado* no está en la consigna.
- Solucionario ej. 14: remitía a §8.1.2 (inexistente); ahora a §3.10.
- Cuadro del solucionario del ej. 21: revisar orden de sílabas y celdas.
- Cap. 1: el microrrelato *El cautivo* (Borges) también quedó como texto a
  incorporar a mano.

### Capítulo 4
- Fragmento de *El País* (ej. 1) y letra de *La luna y tú* (ej. 11): incorporar a mano.
- Imágenes: ej. 6 (-ardo), ej. 14 (ítems 2-7), fig. 1 (viñeta *afortunado*), ej. 17 (ítem 1).
- Remisiones internas corregidas: §5.4 → §4.4.6; §5.3 → §4.4.5; §7.1 → §4.8.1 (conversión).
- Albano y Giammatteo (2000) citado; en la bibliografía figura 2002.
- Fábregas (2015) citado; en la bibliografía figura 2013.
- Darmesteter (1877) citado a través de Serrano-Dolader (1999): no tiene entrada propia.
- Correcciones marcadas: «sonido lateral» (incluye *irracional*); «los derivativos se realizan
  exclusivamente como sufijos» → flexivos; GNC = «Gas Natural Comprimido».
- Faltan ejemplos en el original: *antitranspirar* (ej. 12), *UNA* (ej. 15), *teligente* (ej. 16);
  enlace repetido en FIFA/AFA.
- Solucionario del ej. 10 (parasíntesis) no corresponde a las consignas.
- Solucionario del ej. 11: temas de *cursada* invertidos; ej. 12: categoría de *espectador*.
- Lecturas: verificar título del capítulo de Adelstein y Nercesián y URL de MORFORETEM.

### Capítulo 5
- Textos a incorporar a mano: Bioy Casares (ej. 7), Litvin (ejs. 15 y 17), Saki, *La naturaleza*
  y Cortázar (ej. 24). Los titulares del ej. 16 y los ejemplos de una oración se conservaron.
- Esquemas X' (ejs. 14b, 15, 18, 20, 44, 64, 66 del original): las imágenes no venían en el
  .docx; se rehicieron con forest. Revisar contra los originales.
- Ej. 1: la resolución no corresponde a la oración 1.
- Ej. 3: los subrayados no se conservan; se reconstruyeron a partir de las respuestas.
- Remisiones internas corregidas: abstractos (23) → (24); relacionales (47) → (46);
  notas 28 y 19 → notas reales (se, cuantificadores); ej. 22 «cartera» → *casa*.
- Bosque (1991) y Bosque (1990) citados; en la bibliografía figura Bosque (1989).
- Solucionario: ej. 3 «cansados» → *cansadas*; ej. 5 «Aquellos fuertes temporales» → *Los*;
  ej. 19 c) acepciones de *pobre* invertidas; ej. 20 b) «con o por» para *conforme*;
  ej. 18 la locución *de punta a punta* aparece separada de *de*; ej. 25 «su gobierno».
- Relativos: el original incluye *quien* entre los adverbios relativos.

### Capítulo 6
- Textos a incorporar a mano: Peyrou (ej. 3, oraciones numeradas 1-8) y Asimov (ej. 47 del original).
- Árboles 4b, 9b y 34b: las imágenes no venían en el .docx; se rehicieron con forest.
- Remisiones corregidas: «en (1) la oración está en pasado» → (3a); «étaint» → *étaient*;
  (24b) «Te llamaron» → *Me llamaron*, como en (23b); dos secciones numeradas 4.1 (la segunda
  pasó a 6.4.2); se quitó el resto «Con los nombres propios…» del ej. 1.
- Ej. 6: la resolución no corresponde a la oración 1; el solucionario cambia «expedientes» por
  «informes» y «guardó» por «puso».
- Ej. 3: la numeración de oraciones del solucionario no coincide con la del texto.
- «Cortázar, R.» → J. Cortázar (*Rayuela*). Peyrou figura como «Peyroú (2020)».
- Glosario: se completó la definición de *Foco* con la del capítulo.

### General

- Citas: el formato APA da «Saussure (1916/1945)»; los originales usan
  «1945 [1916]». Definir si se adapta.
- Entradas `REVISAR` del .bib: Vendler 1967 (¿1957?), Rizzi 1995 (¿1997?),
  Bosque 1989/1990, García Negroni 2016 (autoría), DOI de Bosque 2018,
  páginas de Ullman 2006, inicial de Munguía, enlace de Marcovecchio y
  Kaller 2010, autores del libro en Olarrea 2011.
- El cap. 15 no tiene lista de referencias en el .docx de bibliografía.
