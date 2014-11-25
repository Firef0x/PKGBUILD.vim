" Vim syntax file
" Language:     PKGBUILD
" Maintainer:   Firef0x <Firefgx {at) gmail [dot} com>
" Last Change:  2014/11/25
" Version Info: PKGBUILD-0.2 (colorphobic)
" URL:          https://github.com/Firef0x/PKGBUILD.vim

" Add New Keywords For Options: {{{1
syn match pbOptions /\(no\)\?\(strip\|docs\|libtool\|staticlibs\|emptydirs\|zipman\|purge\|upx\|debug\|fakeroot\|distcc\|color\|ccache\|check\|sign\|makeflags\|buildflags\)/ contained
" }}}
" Current Syntax Variable: {{{1
let b:current_syntax = "PKGBUILD"
" }}}
" Vim Modeline: {{{1
" vim: ft=vim: ts=4 sts=4 fdm=marker com+=l\:\"
" }}}
