# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="Encrypted, decentralized messenging platform"
HOMEPAGE="https://tox.im"
EGIT_REPO_URI="https://github.com/irungentoo/ProjectTox-Core"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+av logging"

RDEPEND="dev-libs/libsodium
		dev-libs/check
		dev-libs/libconfig
		av? ( media-libs/libvpx
		      media-libs/opus )
		sys-libs/ncurses"

DEPEND="${RDEPEND}
		dev-libs/libconfig
		sys-devel/automake
		sys-devel/libtool"

src_prepare() {
		eautoreconf
}

src_configure() {
		econf \
			$(use_enable av) \
			$(use_enable logging )
}

src_compile() {
		emake
}
