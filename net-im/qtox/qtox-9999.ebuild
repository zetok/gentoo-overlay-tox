# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qmake-utils git-2

DESCRIPTION="qTox"
HOMEPAGE="https://github.com/tux3/qtox"
SRC_URI=""
EGIT_REPO_URI="git://github.com/tux3/qtox.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5[widgets]
	dev-qt/qtopengl:5
	dev-qt/qtxml:5
	net-libs/tox[av]"
RDEPEND="${DEPEND}
	media-plugins/gst-plugins-meta:0.10[opus,vpx,v4l]"

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		if [[ $(tc-getCXX) == *g++ ]] ; then
			if [[ $(gcc-major-version) == 4 && $(gcc-minor-version) -lt 8 || $(gcc-major-version) -lt 4 ]] ; then
				eerror "You need at least sys-devel/gcc-4.8.0"
				die "You need at least sys-devel/gcc-4.8.0"
			fi
		fi
	fi
}

src_configure() {
	eqmake5
}

src_install() {
	dobin "${S}/qtox"
	doicon -s scalable "${FILESDIR}"/tox.svg
	make_desktop_entry "qtox" "qTox" "/usr/share/icons/hicolor/scalable/apps/tox.svg" "Network"
}

pkg_postinst() {
	elog "For sound you will need either alsa or 'pulseaudio'"
	elog "USE flag in 'dev-qt/qtmultimedia:5' activated, depending on"
	elog "your system setup."
}
