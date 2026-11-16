# Handoff — La gramática: de las nociones teóricas al lenguaje de todos los días

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
| Capítulo 7 | `capitulos/cap07.tex` | cargado; faltan los textos de «Emma Zunz», Hilbert y Cantor |
| Capítulo 8 | `capitulos/cap08.tex` | cargado; falta el fragmento de *Relato de un náufrago* |
| Capítulo 9 | `capitulos/cap09.tex` | cargado; faltan los textos de Enriquez y Viñas |
| Capítulo 10 | `capitulos/cap10.tex` | cargado; faltan imágenes y textos de Infobae, Shua, la revista de decoración y «Akasha» |
| Capítulo 11 | `capitulos/cap11.tex` | cargado; faltan textos de Infobae (ej. 2) y Tato Bores (ej. 3) |
| Capítulo 12 | `capitulos/cap12.tex` | cargado; falta la referencia de la nota sobre Meta (ej. 9) |
| Capítulo 13 | `capitulos/cap13.tex` | cargado; faltan los paratextos periodísticos (ej. 8); siglas a confirmar |
| Capítulo 14 | `capitulos/cap14.tex` | cargado; faltan las letras de canciones (ej. 1) |
| Capítulo 15 | `capitulos/cap15.tex` | cargado; faltan mapa (fig. 15.2) y esquema del pico tonal (fig. 15.3) |
| Capítulos 11-15 | `capitulos/capNN.tex` | pendientes, se cargan de a uno |
| Glosario | `finales/glosario.tex` | único, alfabético, a dos columnas (18-glosario.docx + términos de los caps. 4 a 10) |
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

### Capítulo 7
- Textos a incorporar a mano: «Emma Zunz» de Borges (ejs. 3, 4, 5, 7, 8 y 9), el texto sobre
  Hilbert (ej. 6) y el de Cantor (ej. 7). En cada lugar se anotaron los subrayados.
- Árboles (11) y (31): las imágenes no venían en el .docx; se rehicieron con forest.
- Citas: «Hale y Kayser» → Hale y Keyser; «Williams 1981» → 1980; «Bello (1928)» → bello2002.
- Lect.: Hualde et al. figura con Oxford UP (2011); la 2.ª ed. es de Cambridge UP (2010). Revisar.
- Glosas italianas del recuadro: agregadas (el original solo traducía).
- Solucionario: ej. 1 numera (8) y (9) para los ítems 7 y 8; ej. 2 da por gramatical
  «llegó contento su casa»; ej. 3 analiza *a la hija del muerto* como COD; ej. 5 dice
  «una carta y el sobre»; ej. 7 da *precisión matemática* como específico.
- La numeración repetida de ejemplos del original (32-33) se resolvió con la numeración automática.

### Capítulo 8
- Texto a incorporar a mano: fragmento de *Relato de un náufrago* (ej. 5).
- Correcciones marcadas: «Stephen Spilberg» → Steven Spielberg; doble remisión a (16)
  (colectivos → 15); logros con «–tél» en §3.3 → +tél; en ese párrafo se pasó «MTPer» a MTP.
- Remisiones: «§4» (no existe) → §8.3.1; «§3.5.1» → §8.3.6.1.
- Se omitió la llamada [^0] del original, que no tenía nota.
- Ej. 1, solucionario: los rasgos de *vivir una serie de aventuras* no corresponden a una
  actividad. Ej. 5: «COERSIÓN» → coerción.
- La tabla del solucionario del ej. 5 va en longtable (corta entre páginas).

### Capítulo 9
- Textos a incorporar a mano: Enriquez, «Alguien camina sobre tu tumba» (ej. 8), y Viñas,
  *Un dios cotidiano* (ej. 14).
- Árboles de oración reducida (20c-23c): las imágenes no venían en el .docx; se rehicieron con
  forest. Flechas de (9) en TikZ, con etiquetas abreviadas (Suj, Pred, V, OD, Pvo).
- Remisiones corregidas: «(5)» → (4) copulativos; «cap. 2: §4» → cap. 6, §6.4 (predicados no
  verbales); «§5» → §9.3.3 (pruebas); «como (20)» → (21); notas de homonimia, adverbios
  adjetivales y pruebas de constituencia → \ref. Se eliminó la nota 9, vacía.
- (24): los análisis decían «Los entrenadores»; se unificó con *Los preparadores físicos*.
- Ej. 13 resuelto: etiquetas PO/PSNO intercambiadas respecto de las paráfrasis; rótulos a, b, b
  → a, b, c.
- Ej. 6 solucionario: la lista de i) omitía 1b; 2b figura como predicativo en iii).
- Ej. 4 sol. 9: con *se lo veía*, *solo* se predica del objeto (marcado para revisar).

### Capítulo 10
- Imágenes: pintada y afiche (ejs. 40-42), meme del ej. 12.
- Textos a incorporar a mano: Infobae (ej. 8), Shua, «Ejemplares raros» (ej. 14), copete de la
  revista (ej. 18), «Akasha» de S. Fernández (ej. 21).
- Correcciones marcadas: (12) «Me es COI» → *Te*; «a mí misma» → *a sí misma* en (17);
  «Federico» → *Francisco* en las pruebas de reciprocidad; (36) COD → COI; remisiones (88)-(89)
  → (92)-(93), (108b) → (104b), (107) → (113); «capítulo 9» → cap. 8; «De Miguel, 2009» → 1999;
  «Fernández Soriano, 1990» → 1999; «Di Tullio (2010…)» → 2014; Reflexión final «COD o de COD».
- Ej. 5 (factitivas): agente y causante instigador intercambiados en el original (resuelto y
  solucionario); *se vacunó* figura como COI.
- Ej. 11: las medias figuran con «3ra persona», contra lo dicho en el texto (paradigmáticas).
- Ej. 21: el resuelto dice «estructura sintáctica»; el solucionario, «argumental».
- Giammatteo (2019), citado por *correrse*, no figura en la bibliografía.
- Notas editoriales para revisar: *Se me estafó* (impersonal aceptable en rioplatense);
  *deberse* analizado como pasiva en el solucionario del ej. 14.
- Tabla 1 (pronombres) escalada al ancho de caja; Tabla 2 en longtable.

### Capítulo 11
- Textos a incorporar a mano: fragmento de *Infobae* sobre series (ej. 2), monólogos de Tato Bores
  (ej. 3). Se conservan las oraciones de CORPES XXI, Davies y Saer.
- Correcciones marcadas: análisis (8) «resolvió aplazar» vs. ejemplo «decidió posponer»; remisión
  «capítulo 9» → cap. 10 (pasivas); «capítulo 12» → cap. 14 (modalidad); «(47a/b)» → ejemplos de
  *andar* + gerundio; «voz activa» → *pasiva* (capa del SV); remisiones (86)/(88) → etiquetas
  reales; solucionario del ej. 11 numerado (70)-(73); solucionario del ej. 15 «(1) hemos asimilado»
  → (2); «forma no finita del auxiliar» → del auxiliado.
- «Fernández García y Krivochen» → García Fernández & Krivochen (2019); Yllera citada sin año
  (p. 3429) → 1999. Heine (1991) no figura en la bibliografía (queda dentro de la cita textual).
- Ej. 3: *iremos a comprar* (PV) vs. *iremos a pagarle* (no PV) en el solucionario: revisar.
- Ej. 13: *poder volver a ser atendido* analizado como epistémico con paráfrasis deóntica.
- Ej. 6 y 9: los subrayados no se conservaron en el docx; ej. 2b remite al fragmento reescrito
  sin transcribirlo.
- Ej. 5: las respuestas que el original incluía en la consigna pasaron al solucionario.
- Tabla 1 en longtable; tabla del ej. 12 escalada al ancho de caja.

### Capítulo 12
- Diagramas 1-3 (comentarios «cambiar el árbol» / «Numerar»): rehechos en forest como ejemplos
  numerados (esquema X', esquema del SConj y árbol de *María llegó a la oficina y encendió…*).
- Se conservan oraciones literarias sueltas (Casciari, Schweblin, De Santis, Enriquez) y el
  fragmento breve de *Éste es el mar* (ej. 3). La nota sobre Meta (ej. 9) no tiene fuente.
- Correcciones: doble §3.1 renumerado; dos series (38) → ejemplos distintos; «agramaticalidad de
  (30)» → (31); (24b) «Entro … PS/PSO» → PSNO; (25a) corchete faltante; «a parte» → *aparte*,
  «en vista de ellos» → *ello* (tabla); «Jiménez Julia» → Juliá; «Beijín» → Beijing.
- Ensamble: el original dice que se mencionó en el cap. 6, pero no aparece allí.
- *o sea* figura entre las conjunciones múltiples y en la tabla como marcador explicativo.
- (34b) marcada con * para un orden posible con otra lectura: ¿#?; (42a/c) incoherentes → #.
- Sujeto de *estar contento* caracterizado como PACIENTE (texto original, sin cambios).
- Solucionarios: ej. 3 «dos auxiliares» (son auxiliados, V/Esp); ej. 5 (3) SF → SV, (6) SConj2
  CCL → COD y «asimétrica: es posible cambiar el orden» → simétrica; resuelto del ej. 5 (1)
  *no pueden escapar ni…* como asimétrica: revisar; ej. 7 respuestas 3 y 4 intercambiadas;
  ej. 9 (2) segundo coordinando «SN/Esp» → Comp; (3) primer coordinando recortado; (5B) OComp.
- Ej. 4 (Frodo/Sam/Gollum): se conservan las respuestas con asterisco del original.

### Capítulo 13
- **Siglas (decisión a confirmar)**: el comentario «cambiar OS por OC» choca con OC = oración
  compuesta. Se adoptó: Ocomp = oración compuesta; OC = completiva (incluidas interrogativas
  indirectas e infinitivas argumentales, como en §4.3 del original); OR = relativa; OS =
  subordinada genérica o adjunta sin encabezador/condicional (*si*, *como*, gerundios). «OC/C»
  → OC/CT. Siglas CCM / CCN (coda comparativa / consecutiva): consultar a A. Trombetta.
- Diagramas 1-7 rehechos en forest como ejemplos numerados (1, 2 y 5-6 desde la descripción del
  original; 3, 4 y 7 sin imagen, reconstruidos).
- Ej. 8: los diez paratextos de *La Razón* / *Infobae* van como `\textoaincorporar`; el
  solucionario conserva solo las explicaciones (se omiten los textos con corchetes).
- Ej. 1 no incluía el refrán *El salir de la posada* (sí en ejs. 2 y 6): agregado y renumerado.
  Los ejs. 2 y 6 remiten a la lista del ej. 1 en lugar de repetirla.
- Correcciones: §1 «no incluida en una estructura mayor» → incluida; doble §4.1/4.2 y «# 5.3»
  renumerados; (11a) «SAV» → SAdv; (32c) remitía a (33c); «sí» condicional → *si*; «funcionario»
  → funcionarios; recuadro *hacer*: «no pueden usarse independientemente» (Tipo I) contradice el
  ejemplo; *hace* + *bien*/*así* en (25′); ej. 5 resueltos 1 y 2 hablan de «perífrasis» en *estoy
  cansado*; ej. 7 (3) *para* «sociativo»; (10) «insrumental», (11) «maera»; ej. 6 (16) OS/AS →
  OR/AS; ej. 8 (3) *comprometerse a* con «valor final».
- Martínez García (1996) no figura en la bibliografía. Moreno Cabrera (1991) agregado a cap13.

### Capítulo 14
- El docx dice «CAPÍTULO 12» en el encabezado: es el 14.
- Ej. 1: letras de Calle 13 y J. Drexler → `\textoaincorporar` (solo formas destacadas). Las letras
  de los apartados no coinciden entre enunciado (a, b, c, e, f, g) y solucionario (a–f).
- Comentarios de revisión pendientes: autora (no volver sobre oración/enunciado en §2); F. Carranza
  (precisar futuro narrativo, evidencialidad y presuposición); A. Kaller (boquilla «6*» → «6º»,
  verificar).
- Correcciones: «sudanés» → sundanés; «macedónicas, turcas»; «Willet» → Willett; remisiones a
  Cap. 11 §5.4 → modales, Cap. 10 §5.1.1/5.1.4 → mediopasivas/impersonales, Cap. 13 §5.1 →
  condicionales, «cap. 11; §5.1» → cap. 13 §5.2; doble (12) y doble (38); (33)-(34) citados como
  ejemplo de aspecto/fuerza ilocutiva → (31) y (34); «por lo visto y evidentemente» → *al parecer*;
  «Marcovecchio, 2015, p. 2020».
- García Negroni (2016) → entrada García Negroni y Marcovecchio (2016). Casado (1991) no figura en
  la bibliografía. Fuente de los ejemplos orales (41)-(43) sin consignar.
- Ej. 4: el solucionario no resuelve la oración 3 y numera 2-5; ej. 5: juicio *tuviera que hacer;
  ej. 6: el solucionario repetía el resuelto 1 (comentario de la autora) y no resuelve la 6.

### Capítulo 15
- Bibliografía: el capítulo traía su propia lista de referencias; se cargaron ~40 entradas en
  `bib/referencias.bib` (keyword cap15) y se integran a la bibliografía general.
- Diagrama 1 (pirámide dialectal) rehecho en TikZ; mapa de Vidal de Battini (Wikimedia, CC BY-SA)
  y figura del pico tonal quedan como `\figurapendiente`.
- **Tabla 2 (doblado)**: da «No» para OD con «SN no pronominales», contra lo que dice el texto;
  además el doblado de OD inanimados está atestiguado. Revisar con los autores.
- Recuadro «¿Qué es el lunfardo?»: la cita de Conde (2004) (~120 palabras) se parafraseó; decidir
  si se restituye como cita.
- Correcciones: [ˈah.co] → [ˈah.ko]; *cielo* con doble acento en el solucionario; imperativo de
  *ser* vacío en la tabla del voseo → *sé*; griego ἡ Μαρία transliterado; etiqueta de sección de
  cap03 §5 agregada (`sec:03-transcripcion`).

### Preliminares y siglario
- Título tomado de Prólogo.docx: *La gramática: de las nociones teóricas al lenguaje de todos los
  días*, coord. Mabel Giammatteo y Laura Ferrari. Falta la editorial (portada: `\editorial`).
- Página de créditos con la lista de autores; la del original omite a Natalia Giollo (cap. 12): se
  agregó.
- Cap. 11 retitulado «Perífrasis y locuciones verbales», como en el índice del prólogo (el docx del
  capítulo dice «Las perífrasis verbales»).
- Prólogo: retoques mínimos de puntuación y concordancia («tanto refleja… como las aplica»).
  Se agregó chomsky1957 a la bibliografía.
- Siglario (F. Carranza) movido al final, antes del glosario, como en el índice. Correcciones:
  «Modificar del núcleo oracional» → Modificador; Ladv → LAdv. Se agregó la entrada de llaves
  pedida en la nota del original.
- **Conflicto de siglas**: el siglario define CCM = complemento circunstancial de modo; el cap. 13
  usa CCM para «coda comparativa». OC / Ocomp coinciden con la decisión tomada en el cap. 13.
  Faltan en el siglario siglas usadas en el libro (p. ej., CCN, CT, PSO ya está; APX, OS).

### General

- Citas: el formato APA da «Saussure (1916/1945)»; los originales usan
  «1945 [1916]». Definir si se adapta.
- Entradas `REVISAR` del .bib: Vendler 1967 (¿1957?), Rizzi 1995 (¿1997?),
  Bosque 1989/1990, García Negroni 2016 (autoría), DOI de Bosque 2018,
  páginas de Ullman 2006, inicial de Munguía, enlace de Marcovecchio y
  Kaller 2010, autores del libro en Olarrea 2011.
- El cap. 15 no tiene lista de referencias en el .docx de bibliografía.
