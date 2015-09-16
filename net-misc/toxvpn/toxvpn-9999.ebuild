# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils eutils git-2

DESCRIPTION="toxvpn allows one to make tunneled point to point connections over Tox"
HOMEPAGE="https://github.com/cleverca22/toxvpn"
SRC_URI=""
EGIT_REPO_URI="git://github.com/cleverca22/toxvpn.git
	https://github.com/cleverca22/toxvpn.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/jsoncpp
		net-libs/tox"
DEPEND="${RDEPEND}"

src_prepare() {
	epatch_user
}

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	dobin "${WORKDIR}/${P}_build"/toxvpn
}
