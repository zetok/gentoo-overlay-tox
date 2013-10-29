# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="Encrypted, decentralized messenging platform"
HOMEPAGE="https://github.com/irungentoo/ProjectTox-Core"
EGIT_REPO_URI="https://github.com/irungentoo/ProjectTox-Core"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-libs/libsodium
	dev-libs/check
	dev-libs/libconfig
	media-video/ffmpeg
	sys-libs/ncurses"

DEPEND="${RDEPEND}
	dev-libs/libconfig
	sys-devel/automake
	sys-devel/libtool"

src_prepare() {
#	epatch "${FILESDIR}"/${PN}-look-in-shared-for-DHT.patch
	eautoreconf
}

#src_compile() {
#	use sodium && cmake -DUSE_NACL=OFF || cmake -DUSE_NACL=ON
#	emake
#}

#src_install() {
#	dobin "${WORKDIR}"/${P}/testing/nTox
#	dobin "${WORKDIR}"/${P}/testing/toxic/toxic
#	insinto /usr/share/${PN}
#	doins "${WORKDIR}"/${P}/other/DHTservers
#	dolib "${WORKDIR}"/${P}/core/libtoxcore.so
#}

pkg_postinst() {
	elog "Tox docs are built by sphinx."
	elog "https://projecttox.readthedocs.org/en/latest/start_guide.html"
	elog "https://projecttox.readthedocs.org/en/latest/commands.html"
	elog ""
	elog "You probably want to install net-im/toxic"
}
