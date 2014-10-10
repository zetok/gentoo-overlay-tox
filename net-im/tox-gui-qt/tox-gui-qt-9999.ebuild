# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qmake-utils git-2

DESCRIPTION="GUI for net-libs/tox, using QT5"
HOMEPAGE="https://github.com/nurupo/ProjectTox-Qt-GUI"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

#EGIT_STORE_DIR="${DISTDIR}/egit-src"
EGIT_REPO_URI="git://github.com/nurupo/ProjectTox-Qt-GUI.git"
EGIT_HAS_SUBMODULES=1

DEPEND="dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	net-libs/tox"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch_user
}

src_configure() {
	eqmake5 projectfiles/QtCreator/TOX-Qt-GUI.pro
}

src_install() {
	dobin "${S}/TOX-Qt-GUI"
}
