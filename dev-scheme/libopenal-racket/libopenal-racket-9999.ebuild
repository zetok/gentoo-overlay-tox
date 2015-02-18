# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="Racket bindings for the OpenAL library."
HOMEPAGE="https://github.com/lehitoskin/libopenal-racket"
EGIT_REPO_URI="git://github.com/lehitoskin/libopenal-racket
	https://github.com/lehitoskin/libopenal-racket"
LICENSE="ZLIB"
SLOT="0"

RDEPEND=">=dev-scheme/racket-6.0.1[X]
	media-libs/openal"

src_prepare() {
	epatch_user
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}/usr" install
}

pkg_postinst() {
	raco link -i "/usr/share/racket/pkgs/libopenal-racket"
}

pkg_prerm() {
	raco link -ir "/usr/share/racket/pkgs/libopenal-racket"
}
