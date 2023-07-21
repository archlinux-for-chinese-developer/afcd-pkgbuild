#!/bin/bash
#
desdir="${HOME}/workspace/afcd-repo/x86_64/"
pkgver=1
pkgrel=1
count=0

		for name in $(ls -d afcd-calamares-config*/); do
			count=$[count+1]
			cd $name
			tput setaf 1;echo "Github "$count;tput sgr0;
			sed -i "s/\(^pkgver=\).*/\1$pkgver/" PKGBUILD
			sed -i "s/\(^pkgrel=\).*/\1$pkgrel/" PKGBUILD

			makepkg -f

			mv afcd*pkg.tar.zst $desdir

			rm -r pkg
			rm -r src
			rm -rf afcd*
			echo "#############################################################################################"
			echo "################  "$(basename `pwd`)" done"
			echo "#############################################################################################"
			cd ..
		done
