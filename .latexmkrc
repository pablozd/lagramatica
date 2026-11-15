# latexmk: LuaLaTeX por defecto (para XeLaTeX: latexmk -xelatex)
$pdf_mode = 4;            # 4 = lualatex, 5 = xelatex
$lualatex = 'lualatex -interaction=nonstopmode -synctex=1 %O %S';
$xelatex  = 'xelatex -interaction=nonstopmode -synctex=1 %O %S';
$bibtex_use = 2;          # biber
$out_dir = 'build';
@default_files = ('main.tex');
