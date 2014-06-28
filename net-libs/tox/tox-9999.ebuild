# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="Encrypted, P2P, messenging, audio and video calling platform"
HOMEPAGE="https://tox.im"
EGIT_REPO_URI="https://github.com/irungentoo/ProjectTox-Core"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+av logging nacl"

RDEPEND="!nacl? ( dev-libs/libsodium )
		nacl? ( net-libs/nacl )
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
		# needed, since it doesn't want to work without
		if use nacl; then
			sed -i -e "s,NACL_SEARCH_HEADERS=,NACL_SEARCH_HEADERS=/usr/include/nacl," "${S}/configure.ac" || \
			die "Couldn't set NACL_SEARCH_HEADERS"
			sed -i -e "s,NACL_SEARCH_LIBS=,NACL_SEARCH_LIBS=/usr/lib/nacl," "${S}/configure.ac" || \
			die "Couldn't set NACL_SEARCH_LIBS"
		fi
		eautoreconf
}

src_configure() {
		econf \
			$(use_enable av) \
			$(use_enable logging ) \
			$(use_enable nacl )
}

src_compile() {
		emake
}
