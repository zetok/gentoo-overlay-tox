# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="Encrypted, decentralized messenging platform"
HOMEPAGE="http://wiki.tox.im/Toxic"
EGIT_REPO_URI="git://github.com/Tox/toxic
                           https://github.com/Tox/toxic"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=" ~amd64 ~x86"
IUSE=""

RDEPEND="net-libs/tox
	dev-libs/check
	dev-libs/libconfig
	sys-libs/ncurses"

DEPEND="${RDEPEND}
	dev-libs/libconfig
	sys-devel/automake
	virtual/pkgconfig
	sys-devel/libtool"

src_prepare() {
	eautoreconf
}

pkg_postinst() {
	elog "DHT node list is available in /usr/share/${PN}/DHTservers"
}
