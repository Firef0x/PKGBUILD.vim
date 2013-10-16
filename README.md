# PKGBUILD.vim

# Description

PKGBUILD.vim is a Vim plugin which helps editing and working with PKGBUILD files.

A PKGBUILD is an Arch Linux package build description file
(actually it is a shell script) used when creating packages.

# Credit

This is a modification of [PKGBUILD][4] in Vim Scripts.
Original Maintainer is Nikolai Weibull.

Latest syntax file is grabbed from package [Pacman-Contrib][5] .
Original Maintainer is Alessio 'mOLOk' Bolognino.

# Installation

This plugin follows the standard runtime path structure, and as such it can be
installed with a variety of plugin managers:

*  [Pathogen][1]
  *  `git clone https://github.com/Firef0x/PKGBUILD.vim ~/.vim/bundle/PKGBUILD.vim/`
*  [NeoBundle][2]
  *  `NeoBundle 'Firef0x/PKGBUILD.vim'`
*  [Vundle][3]
  *  `Bundle 'Firef0x/PKGBUILD.vim'`
*  Manual
  *  Copy all of the files into your `~/.vim` directory

[1]: https://github.com/tpope/vim-pathogen
[2]: https://github.com/Shougo/neobundle.vim
[3]: https://github.com/gmarik/vundle
[4]: http://www.vim.org/scripts/script.php?script_id=2700
[5]: https://projects.archlinux.org/pacman.git/tree/contrib/PKGBUILD.vim
