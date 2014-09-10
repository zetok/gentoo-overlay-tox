# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit fdo-mime gnome2-utils toolchain-funcs git-2

DESCRIPTION="Lightweight Tox client"
HOMEPAGE="https://github.com/notsecure/uTox.git"
EGIT_REPO_URI="git://github.com/notsecure/uTox.git
	https://github.com/notsecure/uTox.git"

LICENSE="GPL-3"
SLOT="0"
IUSE="+dbus"

RDEPEND="net-libs/tox[av]
	media-libs/freetype
	media-libs/libv4l
	media-libs/libvpx
	media-libs/openal
	x11-libs/libX11
	x11-libs/libXext
	dbus? ( sys-apps/dbus )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	epatch_user
}

src_configure() {
	# respect CFLAGS
	sed -i \
		-e '/CFLAGS/s# -g ##' \
		Makefile || die
}

src_compile() {
	emake CC="$(tc-getCC)" DBUS=$(usex dbus "1" "0")
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
