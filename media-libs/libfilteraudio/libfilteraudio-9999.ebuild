# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 toolchain-funcs

DESCRIPTION="Lightweight audio filtering library made from webrtc code."
HOMEPAGE="https://github.com/irungentoo/filter_audio"
SRC_URI=""
EGIT_REPO_URI="https://github.com/irungentoo/filter_audio"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_compile() {
		$(tc-getCC) \
		-fPIC \
		${LDFLAGS} \
		${CFLAGS} \
		${S}/filter_audio.c \
		${S}/aec/*.c \
		${S}/agc/*.c \
		${S}/ns/*.c \
		${S}/other/*.c \
		-shared \
		-Wl,-soname,libfilteraudio.so \
		-o ${S}/${PN}.so
}

src_install() {
		dolib ${S}/${PN}.so
		insinto /usr/include
		doins ${S}/filter_audio.h
}
