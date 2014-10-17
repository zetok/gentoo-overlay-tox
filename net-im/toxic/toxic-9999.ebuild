# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools git-2 toolchain-funcs

DESCRIPTION="CLI Frontend for Tox"
HOMEPAGE="http://wiki.tox.im/Toxic"
SRC_URI=""
EGIT_REPO_URI="git://github.com/Tox/toxic
	https://github.com/Tox/toxic"

LICENSE="GPL-3"
SLOT="0"
IUSE="+libnotify +sound-notify +X +AV"

RDEPEND="
	AV? (
            media-libs/openal
            net-libs/tox[av]
	)
	!AV? ( net-libs/tox )
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
		build/Makefile || die
	epatch_user
}

src_compile() {
	use libnotify || export NOTIFY="DISABLE_DESKTOP_NOTIFY=1"
	use sound-notify || export SOUND_NOTIFY="DISABLE_SOUND_NOTIFY=1"
	use X || export X="DISABLE_X11=1"
        use AV || export AV="DISABLE_AV=1"
	emake \
		CC="$(tc-getCC)" \
		USER_CFLAGS="${CFLAGS}" \
		USER_LDFLAGS="${LDFLAGS}" \
		PREFIX="/usr" ${NOTIFY} ${SOUND_NOTIFY} ${X} ${AV} \
		-C build
}

src_install() {
	emake install PREFIX="/usr" DESTDIR="${D}" -C build
}

pkg_postinst() {
	elog "DHT node list is available in /usr/share/${PN}/DHTnodes"
}
