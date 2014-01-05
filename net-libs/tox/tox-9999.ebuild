# Copyright 1999-2013 Gentoo Foundation
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
IUSE=""

RDEPEND="virtual-video/ffmpeg
	dev-libs/libsodium
        dev-libs/check
        dev-libs/libconfig
        sys-libs/ncurses"

DEPEND="${RDEPEND}
        dev-libs/libconfig
        sys-devel/automake
        sys-devel/libtool"

src_prepare() {
        eautoreconf
}

#src_compile() {
#        use sodium && cmake -DUSE_NACL=OFF || cmake -DUSE_NACL=ON
#        emake
#}

#src_install() {
#        dobin "${WORKDIR}"/${P}/testing/nTox
#        dobin "${WORKDIR}"/${P}/testing/toxic/toxic
#        insinto /usr/share/${PN}
#        doins "${WORKDIR}"/${P}/other/DHTservers
#        dolib "${WORKDIR}"/${P}/core/libtoxcore.so
#}

pkg_postinst() {
        elog ""
}
