# PKGBUILD.vim [![Build Status](https://travis-ci.org/Firef0x/PKGBUILD.vim.svg?branch=master)](https://travis-ci.org/Firef0x/PKGBUILD.vim)

# Description

PKGBUILD.vim is a Vim plugin which helps editing and working with PKGBUILD files.

A PKGBUILD is an Arch Linux package build description file
(actually it is a shell script) used when creating packages.

# Installation

This plugin follows the standard runtime path structure, and as such it can be
installed with a variety of plugin managers:

*  [Pathogen][1]
  *  `git clone https://github.com/Firef0x/PKGBUILD.vim.git ~/.vim/bundle/PKGBUILD.vim/`
*  [NeoBundle][2]
  *  `NeoBundle 'Firef0x/PKGBUILD.vim'`
*  [Vundle][3]
  *  `Plugin 'Firef0x/PKGBUILD.vim'` or
  *  `Bundle 'Firef0x/PKGBUILD.vim'`
*  [AUR][10]
  *  Add [Firef0x's Arch Linux Repository][11] and `pacman -S vim-pkgbuild` or
  *  `yaourt -S vim-pkgbuild` or
  *  `packer -S vim-pkgbuild` or
  *  using `makepkg` to build the package and install
*  Manual
  *  Copy all of the files into your `~/.vim` directory

# Usage

Some useful commands:

*  :UpdPkgSums or :UPS
  * execute `updpkgsums` to update the md5sums/sha1sums/... in the current PKGBUILD, required package [pacman>=4][7].
*  :MkAurBall or :MAB
  * execute `mkaurball` to make the AUR package for submission to [Arch User Repository][6], required package [pkgbuild-introspection][8] or [pkgbuild-introspection-git][9].
*  :MkAurBallForce or :MAF
  * execute `mkaurball -f` to force to make the AUR package for submission to [Arch User Repository][6], required package [pkgbuild-introspection][8] or [pkgbuild-introspection-git][9].

# Credit

This is a modification of [PKGBUILD][4] in Vim Scripts.
Original Maintainer is Nikolai Weibull.

Latest syntax file and PKGBUILD template are grabbed from project [Pacman][5] .
Original Maintainer is Alessio 'mOLOk' Bolognino.

It seems that the project has to be released under [GNU GENERAL PUBLIC LICENSE Version 2](LICENSE) which is inherited from project [Pacman][5].

[1]:  https://github.com/tpope/vim-pathogen
[2]:  https://github.com/Shougo/neobundle.vim
[3]:  https://github.com/gmarik/Vundle.vim
[4]:  http://www.vim.org/scripts/script.php?script_id=2700
[5]:  https://projects.archlinux.org/pacman.git
[6]:  https://aur.archlinux.org/
[7]:  https://www.archlinux.org/packages/core/x86_64/pacman/
[8]:  https://www.archlinux.org/packages/community/any/pkgbuild-introspection/
[9]:  https://aur.archlinux.org/packages/pkgbuild-introspection-git
[10]: https://aur.archlinux.org/packages/vim-pkgbuild/
[11]: http://firef0x.github.io/archrepo.html
