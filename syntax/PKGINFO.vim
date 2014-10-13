" Vim syntax file
" Language:     PKGINFO
" Maintainer:   Firef0x <Firefgx {at) gmail [dot} com>
" Last Change:  2014/10/13
" Version Info: PKGBUILD-0.2 (colorphobic)
" URL:          https://github.com/Firef0x/PKGBUILD.vim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

let b:main_syntax = "sh"
let b:is_bash = 1
runtime! syntax/sh.vim

" case on
syn case match

" pkgname
" FIXME if '=' is in pkgname/pkgver, it highlights whole string, not just '='
syn keyword pb_k_pkgname pkgname contained
syn match pbValidPkgname /\([[:alnum:]]\|+\|-\|_\){,32}/ contained contains=pbIllegalPkgname
syn match pbIllegalPkgname /[[:upper:]]\|[^[:alnum:]-+_=]\|=.*=\|=\s\?['"]\?.\{33,\}['"]\?/ contained
syn match pbPkgnameGroup /^\s*pkgname\s=\s.*/ contains=pbIllegalPkgname,pb_k_pkgname

" pkgbase
" FIXME if '=' is in pkgbase/pkgname/pkgver, it highlights whole string, not just '='
syn keyword pb_k_pkgbase pkgbase contained
syn match pbValidPkgbase /\([[:alnum:]]\|+\|-\|_\){,32}/ contained contains=pbIllegalPkgbase
syn match pbIllegalPkgbase /[[:upper:]]\|[^[:alnum:]-+_=]\|=.*=\|=['"]\?.\{33,\}['"]\?/ contained
syn match pbPkgbaseGroup /^\s*pkgbase\s=\s.*/ contains=pbIllegalPkgbase,pb_k_pkgbase

" pkgver
syn keyword pb_k_pkgver pkgver contained
syn match pbValidPkgver /\([[:alnum:]]\|\.\|+\|-\|_\)/ contained contains=pbIllegalPkgver
syn match pbIllegalPkgver /[^[:alnum:]+-=\.\_]\|=.*=/ contained
syn match pbPkgverGroup /^\s*pkgver\s=\s.*/ contains=pbIllegalPkgver,pbValidPkgver,pb_k_pkgver

" pkgrel
syn keyword pb_k_pkgrel pkgrel contained
syn match pbValidPkgrel /[[:digit:]]*/ contained contains=pbIllegalPkgrel
syn match pbIllegalPkgrel /[^[:digit:]=]\|=.*=/ contained
syn match pbPkgrelGroup /^\s*pkgrel\s=\s.*/ contains=pbIllegalPkgrel,pbValidPkgrel,pb_k_pkgrel

" pkgdesc
syn keyword pb_k_desc pkgdesc contained
" 90 chars: 80 for description, 8 for pkgdesc and 2 for ''
syn match pbIllegalPkgdesc /.\{90,}\|=['"]\?.*['" ]\+[iI][sS] [aA]/ contained
syn match pbValidPkgdesc /[^='"]\.\{,80}/ contained contains=pbIllegalPkgdesc
syn match pbPkgdescGroup /^\s*pkgdesc\s=\s.*/ contains=pbIllegalPkgdesc,pb_k_desc,pbValidPkgdesc

" packager
syn keyword pb_k_packager packager contained
syn match pbValidPackager /[^='"]\.*/ contained
syn match pbIllegalPackager /[^=]/ contained contains=pbValidPackager
syn match pbPackagerGroup /^\s*packager\s=\s.*/ contains=pbValidPackager,pb_k_packager,pbIllegalPackager

" builddate
syn keyword pb_k_builddate builddate contained
syn match pbValidBuilddate /[[:digit:]]*/ contained contains=pbIllegalBuilddate
syn match pbIllegalBuilddate /[^[:digit:]=]\|=.*=/ contained
syn match pbBuilddateGroup /^\s*builddate\s=\s.*/ contains=pbIllegalBuilddate,pbValidBuilddate,pb_k_builddate

" size
syn keyword pb_k_size size contained
syn match pbValidSize /[[:digit:]]*/ contained contains=pbIllegalSize
syn match pbIllegalSize /[^[:digit:]=]\|=.*=/ contained
syn match pbSizeGroup /^\s*size\s=\s.*/ contains=pbIllegalSize,pbValidSize,pb_k_size

" epoch
syn keyword pb_k_epoch epoch contained
syn match pbValidEpoch /[[:digit:]]*/ contained contains=pbIllegalEpoch
syn match pbIllegalEpoch /[^[:digit:]=]\|=.*=/ contained
syn match pbEpochGroup /^\s*epoch\s=\s.*/ contains=pbIllegalEpoch,pbValidEpoch,pb_k_epoch

" url
syn keyword pb_k_url url contained
syn match pbValidUrl /['"]*\(https\|http\|ftp\)\:\/.*\.\+.*/ contained

syn match pbIllegalUrl /[^=]/ contained contains=pbValidUrl
syn match pbUrlGroup /^\s*url\s=\s.*/ contains=pbValidUrl,pb_k_url,pbIllegalUrl

" license
syn keyword pb_k_license license contained
" echo $(pacman -Ql licenses | grep '/usr/share/licenses/common/' | cut -d'/' -f6 | sort -u)
syn keyword pbLicense  AGPL AGPL3 Apache APACHE Artistic2.0 CCPL CDDL CPL EPL FDL FDL1.2 FDL1.3 GPL GPL2 GPL3 LGPL LGPL2.1 LGPL3 LPPL MPL PerlArtistic PHP PSF RUBY W3C ZPL contained
" special cases from https://wiki.archlinux.org/index.php/Arch_Packaging_Standards
syn keyword pbLicenseSpecial  BSD MIT ZLIB Python contained
syn match pbLicenseCustom /custom\(:[[:alnum:]]*\)*/ contained
syn match pbLicenseGroup /^\s*license\s=\s.*/ contains=pb_k_license,pbLicenseCustom,pbLicenseSpecial,pbLicense

" backup
syn keyword pb_k_backup backup contained
syn match pbValidBackup   /\.\?[[:alpha:]]*\/[[:alnum:]\{\}+._$-]*]*/ contained
syn match pbBackupGroup /^\s*backup\s=\s.*/ contains=pb_k_backup,pbValidBackup

" arch
syn keyword pb_k_arch arch contained
syn keyword pbArch i686 x86_64 ppc any contained
syn match pbArchGroup /^\s*arch\s=\s.*/ contains=pb_k_arch,pbArch

" groups
syn keyword pb_k_groups groups contained
syn match pbValidGroups /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbGroupsGroup /^\s*groups\s=\s.*/ contains=pb_k_groups,pbValidGroups

" depends
syn keyword pb_k_depends depend[s] contained
syn match pbValidDepends /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbDependsGroup /^\s*depend\%[s]\s=\s.*/ contains=pb_k_depends,pbValidDepends

" makedepends
syn keyword pb_k_makedepends makedepend[s] contained
syn match pbValidMakedepends /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbMakedependsGroup /^\s*makedepend\%[s]\s=\s.*/ contains=pb_k_makedepends,pbValidMakedepends

" optdepends
syn keyword pb_k_optdepends optdepend[s] contained
syn match pbValidOptdepends /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbOptdependsGroup /^\s*optdepend\%[s]\s=\s.*/ contains=pb_k_optdepends,pbValidOptdepends

" checkdepends
syn keyword pb_k_ckdepends checkdepend[s] contained
syn match pbValidCkdepends /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbCkdependsGroup /^\s*checkdepend\%[s]\s=\s.*/ contains=pb_k_ckdepends,pbValidCkdepends

" conflicts
syn keyword pb_k_conflicts conflict[s] contained
syn match pbValidConflicts /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbConflictsGroup /^\s*conflict\%[s]\s=\s.*/ contains=pb_k_conflicts,pbValidConflicts

" provides
syn keyword pb_k_provides provide[s] contained
syn match pbValidProvides /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbProvidesGroup /^\s*provide\%[s]\s=\s.*/ contains=pb_k_provides,pbValidProvides

" replaces
syn keyword pb_k_replaces replace[s] contained
syn match pbValidReplaces /\([[:alnum:]]\|+\|-\|_\)*/ contained
syn match pbReplacesGroup /^\s*replace\%[s]\s=\s.*/ contains=pb_k_replaces,pbValidReplaces

" install
" XXX remove install from bashStatement, fix strange bug
syn clear bashStatement
syn keyword bashStatement chmod clear complete du egrep expr fgrep find gnufind gnugrep grep less ls mkdir mv rm rmdir rpm sed sleep sort strip tail touch

syn keyword pb_k_install install contained
syn match pbValidInstall /\([[:alnum:]]\|\$\|+\|-\|_\)*\.install/ contained
syn match pbIllegalInstall /[^=]/ contained contains=pbValidInstall
syn match pbInstallGroup /^\s*install\s=\s.*/ contains=pb_k_install,pbValidInstall,pbIllegalInstall,shDeref

" changelog
syn keyword pb_k_changelog changelog contained
syn match pbValidChangelog /\([[:alnum:]]\|\$\|+\|-\|_\)*/ contained
syn match pbIllegalChangelog /[^=]/ contained contains=pbValidChangelog
syn match pbChangelogGroup /^\s*changelog\s=\s.*/ contains=pb_k_changelog,pbValidChangelog,pbIllegalChangelog,shDeref

" source:
" XXX remove source from shStatement, fix strange bug
syn clear shStatement
syn keyword shStatement xxx wait getopts return autoload whence printf true popd nohup enable r trap readonly fc fg kill ulimit umask disown stop pushd read history logout times local exit test pwd time eval integer suspend dirs shopt hash false newgrp bg print jobs continue functions exec help cd break unalias chdir type shift builtin let bind

syn keyword pb_k_source source contained
syn match pbIllegalSource /\(http\|ftp\|https\).*\.\+\(dl\|download.\?\)\.\(sourceforge\|sf\).net/
syn match pbSourceGroup  /^\s*source\s=\s.*/ contains=pb_k_source,pbIllegalSource,shNumber,pbDerefEmulation
syn match pbDerefEmulation /\$[{]\?[[:alnum:]_]*[}]\?/ contained
hi def link pbDerefEmulation PreProc

" md5sums
syn keyword pb_k_md5sums md5sums contained
syn match pbIllegalMd5sums /[^='"()\/ ]/ contained contains=pbValidMd5sums
syn match pbValidMd5sums /\x\{32\}/ contained
syn match pbMd5sumsGroup /^\s*md5sums\s=\s.*/ contains=pb_k_md5sums,pbMd5Quotes,pbMd5Hash,pbIllegalMd5sums keepend
syn match pbMd5Quotes /'.*'\|".*"/ contained contains=pbMd5Hash,pbIllegalMd5sums
syn match pbMd5Hash /\x\+/ contained contains=pbValidMd5sums
hi def link pbMd5Quotes Keyword
hi def link pbMd5Hash Error
hi def link pbValidMd5sums  Number

" sha1sums
syn keyword pb_k_sha1sums sha1sums contained
syn match pbIllegalSha1sums /[^='"()\/ ]/ contained contains=pbValidSha1sums
syn match pbValidSha1sums /\x\{40\}/ contained
syn match pbSha1sumsGroup /^\s*sha1sums\s=\s.*/ contains=pb_k_sha1sums,pbSha1Quotes,pbSha1Hash,pbIllegalSha1sums keepend
syn match pbSha1Quotes /'.*'\|".*"/ contained contains=pbSha1Hash,pbIllegalSha1sums
syn match pbSha1Hash /\x\+/ contained contains=pbValidSha1sums
hi def link pbSha1Quotes Keyword
hi def link pbSha1Hash Error
hi def link pbValidSha1sums  Number

" sha256sums
syn keyword pb_k_sha256sums sha256sums contained
syn match pbIllegalSha256sums /[^='"()\/ ]/ contained contains=pbValidSha256sums
syn match pbValidSha256sums /\x\{64\}/ contained
syn match pbSha256sumsGroup /^\s*sha256sums\s=\s.*/ contains=pb_k_sha256sums,pbSha256Quotes,pbSha256Hash,pbIllegalSha256sums keepend
syn match pbSha256Quotes /'.*'\|".*"/ contained contains=pbSha256Hash,pbIllegalSha256sums
syn match pbSha256Hash /\x\+/ contained contains=pbValidSha256sums
hi def link pbSha256Quotes Keyword
hi def link pbSha256Hash Error
hi def link pbValidSha256sums  Number

" sha384sums
syn keyword pb_k_sha384sums sha384sums contained
syn match pbIllegalSha384sums /[^='"()\/ ]/ contained contains=pbValidSha384sums
syn match pbValidSha384sums /\x\{96\}/ contained
syn match pbSha384sumsGroup /^\s*sha384sums\s=\s.*/ contains=pb_k_sha384sums,pbSha384Quotes,pbSha384Hash,pbIllegalSha384sums keepend
syn match pbSha384Quotes /'.*'\|".*"/ contained contains=pbSha384Hash,pbIllegalSha384sums
syn match pbSha384Hash /\x\+/ contained contains=pbValidSha384sums
hi def link pbSha384Quotes Keyword
hi def link pbSha384Hash Error
hi def link pbValidSha384sums  Number

" sha512sums
syn keyword pb_k_sha512sums sha512sums contained
syn match pbIllegalSha512sums /[^='"()\/ ]/ contained contains=pbValidSha512sums
syn match pbValidSha512sums /\x\{128\}/ contained
syn match pbSha512sumsGroup /^\s*sha512sums\s=\s.*/ contains=pb_k_sha512sums,pbSha512Quotes,pbSha512Hash,pbIllegalSha512sums keepend
syn match pbSha512Quotes /'.*'\|".*"/ contained contains=pbSha512Hash,pbIllegalSha512sums
syn match pbSha512Hash /\x\+/ contained contains=pbValidSha512sums
hi def link pbSha512Quotes Keyword
hi def link pbSha512Hash Error
hi def link pbValidSha512sums  Number

" options
syn keyword pb_k_options options contained
syn match pbOptions /\(no\)\?\(strip\|docs\|libtool\|staticlibs\|emptydirs\|zipman\|purge\|upx\|debug\|fakeroot\|distcc\|color\|ccache\|check\|sign\|makeflags\|buildflags\)/ contained
syn match   pbOptionsNeg     /\!/ contained
syn match   pbOptionsDeprec  /no/ contained
syn match pbOptionsGroup /^\s*options\s=\s.*/ contains=pb_k_options,pbOptions,pbOptionsNeg,pbOptionsDeprec,pbIllegalOption
syn match pbIllegalOption /[^!"'()= ]/ contained contains=pbOptionsDeprec,pbOptions

" makepkgopt
syn keyword pb_k_makepkgopt makepkgopt contained
syn match pbMakepkgopt /\(no\)\?\(strip\|docs\|libtool\|staticlibs\|emptydirs\|zipman\|purge\|upx\|debug\|fakeroot\|distcc\|color\|ccache\|check\|sign\|makeflags\|buildflags\)/ contained
syn match   pbMakepkgoptNeg     /\!/ contained
syn match   pbMakepkgoptDeprec  /no/ contained
syn match pbMakepkgoptGroup /^\s*makepkgopt\s=\s.*/ contains=pb_k_makepkgopt,pbMakepkgopt,pbMakepkgoptNeg,pMakepkgoptsDeprec,pbIllegalMakepkgopt
syn match pbIllegalMakepkgopt /[^!"'()= ]/ contained contains=pbMakepkgoptDeprec,pbMakepkgopt

" noextract
syn match pbNoextract /[[:alnum:]+._${}-]\+/ contained
syn keyword pb_k_noextract noextract  contained
syn match pbNoextractGroup  /^\s*noextract\s=\s.*/ contains=pb_k_noextract,pbNoextract

" comments
syn keyword    pb_k_maintainer Maintainer Contributor contained
syn match      pbMaintainerGroup /Maintainer.*/ contains=pbMaintainer contained

syn match pbDate /[0-9]\{4}\/[0-9]\{2}\/[0-9]\{2}/ contained

syn cluster    pbCommentGroup	contains=pbTodo,pb_k_maintainer,pbMaintainerGroup,pbDate
syn keyword    pbTodo	contained	COMBAK FIXME TODO XXX
syn match      pbComment	"^#.*$"	contains=@pbCommentGroup
syn match      pbComment	"[^0-9]#.*$"	contains=@pbCommentGroup

hi def link pbComment Comment
hi def link pbTodo Todo

hi def link pbIllegalPkgname Error
hi def link pb_k_pkgname pbKeywords

hi def link pbIllegalPkgbase Error
hi def link pb_k_pkgbase pbKeywords

hi def link pbIllegalPkgver Error
hi def link pb_k_pkgver pbKeywords

hi def link pbIllegalPkgrel Error
hi def link pb_k_pkgrel pbKeywords

hi def link pbIllegalPkgdesc Error
hi def link pb_k_desc pbKeywords

hi def link pbIllegalPackager Error
hi def link pb_k_packager pbKeywords

hi def link pbIllegalBuilddate Error
hi def link pb_k_builddate pbKeywords

hi def link pbIllegalSize Error
hi def link pb_k_size pbKeywords

hi def link pbIllegalEpoch Error
hi def link pb_k_epoch pbKeywords

hi def link pbIllegalUrl Error
hi def link pb_k_url pbKeywords

hi def link pb_k_license pbKeywords
hi def link pbIllegalLicense Error

hi def link pb_k_backup pbKeywords

hi def link pb_k_arch pbKeywords
hi def link pbIllegalArch Error

hi def link pb_k_groups pbKeywords
hi def link pb_k_makedepends pbKeywords
hi def link pb_k_optdepends pbKeywords
hi def link pb_k_ckdepends pbKeywords
hi def link pb_k_depends pbKeywords
hi def link pb_k_replaces pbKeywords
hi def link pb_k_conflicts pbKeywords
hi def link pb_k_provides pbKeywords

hi def link pbIllegalInstall Error
hi def link pb_k_install pbKeywords

hi def link pbIllegalChangelog Error
hi def link pb_k_changelog pbKeywords

hi def link pb_k_source pbKeywords
hi def link pbIllegalSource Error

hi def link pb_k_md5sums pbKeywords
hi def link pbIllegalMd5sums Error

hi def link pb_k_sha1sums pbKeywords
hi def link pbIllegalSha1sums Error

hi def link pb_k_sha256sums pbKeywords
hi def link pbIllegalSha256sums Error

hi def link pb_k_sha384sums pbKeywords
hi def link pbIllegalSha384sums Error

hi def link pb_k_sha512sums pbKeywords
hi def link pbIllegalSha512sums Error

hi def link pb_k_options pbKeywords
hi def link pbOptionsDeprec Todo
hi def link pbIllegalOption Error

hi def link pb_k_makepkgopt pbKeywords
hi def link pbMakepkgoptDeprec Todo
hi def link pbIllegalMakepkgopt Error

hi def link pb_k_noextract pbKeywords
hi def link pbNoextract Normal

hi def link pb_k_maintainer pbKeywords

hi def link pbKeywords Keyword

hi def link pbDate Special

let b:current_syntax = "PKGINFO"

" vim: ft=vim

