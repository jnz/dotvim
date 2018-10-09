" I am not going to include those awful vimballs by DrChip
"
call TexNewMathZone("E","align",1)
call TexNewMathZone("F","alignat",1)
call TexNewMathZone("G","equation",1)
call TexNewMathZone("H","flalign",1)
call TexNewMathZone("I","gather",1)
call TexNewMathZone("J","multline",1)
call TexNewMathZone("K","xalignat",1)
call TexNewMathZone("L","xxalignat",0)

" syn match texBadMath		"\\end\s*{\s*\(align\|alignat\|equation\|flalign\|gather\|multline\|xalignat\|xxalignat\)\*\=\s*}"

" Amsmath [lr][vV]ert  (Holger Mitschke)
"let s:texMathDelimList=[
     "\ ['\\lvert'     , '|'] ,
     "\ ['\\rvert'     , '|'] ,
     "\ ['\\lVert'     , '‖'] ,
     "\ ['\\rVert'     , '‖'] ,
     "\ ]
"for texmath in s:texMathDelimList
    "execute "syntax match texMathDelim '\\\\[bB]igg\\=[lr]\\=".texmath[0]."' contained conceal cchar=".texmath[1]
"endfor

syntax match texInputFile /\\includepdf\%(\[.\{-}\]\)\=\s*{.\{-}}/
      \ contains=texStatement,texInputCurlies,texInputFileOpt
syntax match texInputFile /\\subfile\s*\%(\[.\{-}\]\)\=\s*{.\{-}}/
      \ contains=texStatement,texInputCurlies,texInputFileOpt

"syntax match texInputFile
      "\ '\\includegraphics<[^>]*>\(\[.\{-}\]\)\=\s*{.\{-}}'
      "\ contains=texStatement,texBeamerOpt,texInputCurlies,texInputFileOpt
