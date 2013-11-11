# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools flag-o-matic git-r3 multilib

DESCRIPTION="Free as in freedom Skype replacement"
HOMEPAGE="http://tox.im/"
EGIT_REPO_URI="git://github.com/irungentoo/ProjectTox-Core.git
			   https://github.com/irungentoo/ProjectTox-Core.git"
EGIT_COMMIT="e2e168920960632a6e908ab02c1cd3b4510093cd"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="-nacl ncurses server +sodium static-libs test"
REQUIRED_USE="^^ ( nacl sodium )"

RDEPEND="virtual/ffmpeg
		 nacl?    ( virtual/nacl )
		 ncurses? ( sys-libs/ncurses )
		 sodium?  ( dev-libs/libsodium )"
DEPEND="${RDEPEND}
		test? ( dev-libs/check )"

DOCS="README.md"

src_prepare() {
	eautoreconf
}

src_configure() {
	append-ldflags -Wl,-z,noexecstack
	econf \
		$(use_enable nacl) \
		$(use_enable server dht-bootstrap-daemon) \
		$(use_enable test tests) \
		$(use_enable ncurses ntox) \
		$(use_enable static-libs static) \
		--with-nacl-headers=/usr/include/nacl \
		--with-nacl-libs=/usr/$(get_libdir)/nacl
}

src_install() {
	default
	prune_libtool_files
}

pkg_postinst() {
	elog "DHT node list is available in /usr/share/${PN}/DHTservers"
	elog "or in #tox @ irc.freenode.org"
}
