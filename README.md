# Manual de gramática del español — fuente LaTeX

Compilación: LuaLaTeX (por defecto) o XeLaTeX, con biber.

```zsh
latexmk                 # LuaLaTeX, salida en build/main.pdf
latexmk -xelatex        # XeLaTeX
```

Requisitos (Manjaro): `texlive-basic texlive-latexextra texlive-luatex texlive-xetex texlive-fontsextra texlive-bibtexextra texlive-humanities texlive-langspanish biber`.

## Estructura

```
main.tex                    documento maestro: \include de cada capítulo
config/paquetes.tex         solo paquetes y sus opciones
config/estilo.tex           diseño: página, fuentes, títulos, entornos
bib/referencias.bib         bibliografía (biblatex-apa, palabras clave por capítulo)
preliminares/               portada, prólogo, siglario
capitulos/capNN.tex         un archivo por capítulo (cap01 … cap15)
capitulos/plantilla-capitulo.tex   plantilla para copiar
finales/glosario.tex        glosario único, alfabético, a dos columnas
pruebas/diseno.tex          documento de prueba del diseño (capítulo de muestra)
.github/workflows/pdf.yml   compila el PDF en cada push (artefacto «manual-pdf»)
HANDOFF.md                  estado del proyecto y próximos pasos
```

Agregar un capítulo: crear `capitulos/capNN.tex` a partir de la plantilla y
descomentar `\include{capitulos/capNN}` en `main.tex`. Los capítulos se
incluyen en orden.

## Convenciones

| Elemento | Código | Resultado |
|---|---|---|
| Capítulo con autor | `\capitulo{Título}{Autor}` | firma en el cuerpo y en el índice |
| Ejemplo del texto | `\begin{exe}\ex ...\end{exe}` | (1), (2a): continuo por capítulo |
| Ejemplo de ejercicio | mismo `exe` dentro de `ejercicio` | 1., 2. a.: se reinicia en cada ejercicio |
| Juicio | `\ex[*]{...}`, `\juicio{??}{forma}` | |
| Glosa | `\gll ... \\ ... \\ \glt ‘...’` + `\Acc`, `\Sg`, `\Dom` | Leipzig, versalitas |
| Remisión | `\exref{lbl}`, `\exrefs{a}{b}` | (7), (7)-(9) |
| Ejercicio | `\begin{ejercicio}[subtítulo]` | numeración por capítulo |
| Consignas a), b) | `\begin{consignas}\item ...` | |
| Ejemplo resuelto | `\begin{resuelto}[Aclaraciones]` | |
| Recuadro | `\begin{recuadro}[Título]`, `\begin{destacado}` | |
| Árbol | `\begin{arbol}[SV [V] [SD, roof]]\end{arbol}` | forest |
| Cita en bloque | `\begin{cita}` | |
| Cuadros +/– | `\mas`, `\menos`, `\masmenos`; columnas `C`, `L`, `Y{ancho}` | |
| Glosario general | `\begin{glosariogeneral}\item[Término:] ...` | dos columnas |
| Ítem resuelto | `\respuesta{...}` | respuesta en color |
| Renglones para completar | `\completar[n]` | n líneas punteadas |
| Palabra subrayada | `\subrayado{...}` | |
| Texto de lectura | `\begin{textolectura}[Título]` | cuentos, fragmentos |
| Figura sin imagen | `\figurapendiente{Epígrafe}{fig:etiqueta}` | |
| Duda del original | `\pendiente{...}` | marca roja en el PDF |
| Secciones finales | `\lecturasrecomendadas`, `\solucionario` + `solucion{n}` | glosario y bibliografía van al final del libro | |

## Bibliografía

Cada entrada lleva `keywords = {capNN, ...}` (referencias del capítulo NN) y,
si corresponde, `lectNN` (lecturas recomendadas); `nobib` excluye una entrada
de la bibliografía final. `\lecturasrecomendadas` filtra por el número del
capítulo en curso, así que el orden de `\include` en `main.tex` tiene que
coincidir con la numeración. `\bibliografiageneral` (al final del libro)
imprime lo citado más las entradas `capNN`/`lectNN` de los capítulos incluidos.

Ajustes sobre biblatex-apa: «y» en lugar de «&», sin coma antes de «y» con dos
autores, «Obra original publicada en», partícula pospuesta (Saussure, F. de),
(Vol. 2, pp. x-y) y tipos de editor Coord./Dir./Comp. (`editortype`).

Las entradas con datos dudosos del original llevan un comentario `REVISAR`.
