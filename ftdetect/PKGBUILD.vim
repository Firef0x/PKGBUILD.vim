" Vim filetype detect file
" Language:     PKGBUILD
" Maintainer:   Firef0x <Firefgx {at) gmail [dot} com>
" Last Change:  2014/10/13
" Version Info: PKGBUILD-0.2 (colorphobic)
" URL:          https://github.com/Firef0x/PKGBUILD.vim

" FileType Detect Autocmd: {{{1
autocmd BufNewFile,BufRead PKGBUILD set ft=PKGBUILD
autocmd BufNewFile,BufRead *.install,install,.INSTALL set ft=sh
autocmd BufNewFile,BufRead .AURINFO,.PKGINFO set ft=PKGBUILD syn=PKGINFO

" Vim Modeline: {{{1
" vim: ft=vim: ts=4 sts=4 fdm=marker com+=l\:\"
" }}}
