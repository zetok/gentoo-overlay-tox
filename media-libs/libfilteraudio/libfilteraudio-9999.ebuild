# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 toolchain-funcs

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

src_prepare() {
		epatch_user
}

src_compile() {
		emake CC="$(tc-getCC)"
}

src_install() {
		emake DESTDIR="${D}" PREFIX="/usr" install
}
