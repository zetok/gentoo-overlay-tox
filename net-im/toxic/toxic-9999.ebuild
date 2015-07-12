# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils git-2 toolchain-funcs

DESCRIPTION="CLI Frontend for Tox"
HOMEPAGE="https://wiki.tox.chat/clients/toxic"
SRC_URI=""
EGIT_REPO_URI="git://github.com/Tox/toxic
	https://github.com/Tox/toxic"

LICENSE="GPL-3"
SLOT="0"
IUSE="+av +libnotify +sound-notify +X"

RDEPEND="
	av? (
		media-libs/openal
		net-libs/tox[av] )
	!av? ( net-libs/tox )
	libnotify? ( x11-libs/libnotify )
	sound-notify? ( media-libs/freealut )
	X? ( x11-libs/libX11 )
	sys-libs/ncurses
	dev-libs/libconfig"
DEPEND="${RDEPEND}
	app-text/asciidoc
	virtual/pkgconfig"

src_prepare() {
	# verbose build
	sed -i \
		-e 's/@$(CC)/$(CC)/' \
		Makefile || die
	epatch_user
}

src_compile() {
	use av || export AV="DISABLE_AV=1"
	use libnotify || export NOTIFY="DISABLE_DESKTOP_NOTIFY=1"
	use sound-notify || export SOUND_NOTIFY="DISABLE_SOUND_NOTIFY=1"
	use X || export X="DISABLE_X11=1"
	emake \
		CC="$(tc-getCC)" \
		USER_CFLAGS="${CFLAGS}" \
		USER_LDFLAGS="${LDFLAGS}" \
		PREFIX="/usr" ${NOTIFY} ${SOUND_NOTIFY} ${X} ${AV}
}

src_install() {
	use av || export AV="DISABLE_AV=1"
	use libnotify || export NOTIFY="DISABLE_DESKTOP_NOTIFY=1"
	use sound-notify || export SOUND_NOTIFY="DISABLE_SOUND_NOTIFY=1"
	use X || export X="DISABLE_X11=1"

	# ↑ needed workaround, without it "missing" things may compile again in install() –.–"

	emake \
		install PREFIX="/usr" DESTDIR="${D}" \
		${NOTIFY} ${SOUND_NOTIFY} ${X} ${AV} # part of workaround

}

pkg_postinst() {
	elog "DHT node list is available in /usr/share/${PN}/DHTnodes"
}
