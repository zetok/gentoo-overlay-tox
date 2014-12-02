# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Racket bindings for the Tox library."
HOMEPAGE="https://github.com/lehitoskin/libtoxcore-racket"
EGIT_REPO_URI="git://github.com/lehitoskin/libtoxcore-racket
	https://github.com/lehitoskin/libtoxcore-racket"
LICENSE="GPL-3"
SLOT="0"

RDEPEND=">=dev-scheme/racket-6.0.1[X]"

src_compile() {
	raco make main.rkt
}

src_install() {
	mkdir -pv "${D}/usr/share/racket/pkgs/libtoxcore-racket"
	cp -Rv * "${D}/usr/share/racket/pkgs/libtoxcore-racket/"
}

pkg_postinst() {
	raco link -i "/usr/src/racket/pkgs/libtoxcore-racket"
}

pkg_prerm() {
	raco link -ir "/usr/src/racket/pkgs/libtoxcore-racket"
}
