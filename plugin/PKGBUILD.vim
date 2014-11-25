" Vim plugin file
" Language:     PKGBUILD
" Maintainer:   Firef0x <Firefgx {at) gmail [dot} com>
" Last Change:  2014/10/17
" Version Info: PKGBUILD-0.2 (colorphobic)
" URL:          https://github.com/Firef0x/PKGBUILD.vim

" Init: {{{1
let s:cpo= &cpo
if exists("g:loaded_pkgbuild_vim") || &cp
	finish
endif
set cpo&vim
let g:loaded_pkgbuild_vim = 1

" Plugin Functions: {{{1

" Normalize The Path: {{{2
" replace the windows path sep \ with /
function! <SID>NormalizePath(path)
	return substitute(a:path, "\\", "/", "g")
endfunction

" Template Searching: {{{2
" Returns a string containing the path of the parent directory of the given
" path. Works like dirname(3). It also simplifies the given path.
function! <SID>DirName(path)
	let l:tmp = <SID>NormalizePath(a:path)
	return substitute(l:tmp, "[^/][^/]*/*$", "", "")
endfunction

" Loads Template: {{{2
" Default templates directory {{{3
let s:default_template_dir = <SID>DirName(<SID>DirName(expand("<sfile>"))) . "templates"

" substitutes variables and puts cursor at %HERE%. Used to implement the BufNewFile autocommand. {{{3
function! <SID>TLoad()
	let l:tFile = s:default_template_dir . "/PKGBUILD"
	execute "0r " . l:tFile
	0
	setlocal nomodified
endfunction

" New PKGBUILD from templates {{{3
augroup PKGBUILDVIM
	autocmd!
	autocmd BufNewFile PKGBUILD call <SID>TLoad()
augroup END

" Plugin Commands: {{{1

if executable('updpkgsums')
	" Define the Command alias {{{2
	command! -nargs=0 -bar UpdPkgSums :UPS
	" Define the actual Command {{{2
	command! -nargs=0 -bar UPS silent! lcd %:p:h
				\| silent! exe '!updpkgsums > /dev/null'
				\| echon "Package sums updated."
endif
" }}}

if executable('mkaurball')
	" Define the Command alias {{{2
	command! -nargs=0 -bar MkAurBall :MAB
	command! -nargs=0 -bar MkAurBallForce :MAF
	" Define the actual Command {{{2
	command! -nargs=0 -bar MAB silent! lcd %:p:h
				\| silent! exe '!mkaurball > /dev/null'
				\| echon "AUR source package created."
	command! -nargs=0 -bar MAF silent! lcd %:p:h
				\| silent! exe '!mkaurball -f > /dev/null'
				\| echon "AUR source package created."
endif

" Restore: {{{1
let &cpo=s:cpo
unlet s:cpo

" Vim Modeline: {{{1
" vim: ft=vim: ts=4 sts=4 fdm=marker com+=l\:\"
" }}}
