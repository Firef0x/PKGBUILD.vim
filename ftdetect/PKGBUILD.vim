" Vim filetype detect file
" Language:	sh
" Maintainer:	Firef0x
" Last Changed: 2014 Jul 04
" URL:		https://github.com/Firef0x/PKGBUILD.vim
"
autocmd BufNewFile,BufRead PKGBUILD set ft=PKGBUILD
autocmd BufNewFile,BufRead *.install,install set ft=sh
autocmd BufNewFile,BufRead .AURINFO set ft=PKGBUILD
