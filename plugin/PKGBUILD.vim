" Vim plugin file
" Language:	sh
" Maintainer:	Firef0x
" Last Changed: 2013 Oct 16
" URL:		https://github.com/Firef0x/PKGBUILD.vim
"
" normalize the path
" replace the windows path sep \ with /
function! <SID>NormalizePath(path)
	return substitute(a:path, "\\", "/", "g")
endfunction

" Template searching. {{{1
" Returns a string containing the path of the parent directory of the given
" path. Works like dirname(3). It also simplifies the given path.
function! <SID>DirName(path)
	let l:tmp = <SID>NormalizePath(a:path)
	return substitute(l:tmp, "[^/][^/]*/*$", "", "")
endfunction

" Default templates directory
let s:default_template_dir = <SID>DirName(<SID>DirName(expand("<sfile>"))) . "templates"

" Loads a template for the current buffer, substitutes variables and puts
" cursor at %HERE%. Used to implement the BufNewFile autocommand.
function! <SID>TLoad()
	let l:tFile = s:default_template_dir . "/PKGBUILD"
	execute "0r " . l:tFile
	0
	setlocal nomodified
endfunction

" New PKGBUILD from templates
augroup PKGBUILDVIM
	autocmd!
	autocmd BufNewFile PKGBUILD call <SID>TLoad()
augroup END

" vim: ft=vim: nofen
