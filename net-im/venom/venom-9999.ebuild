# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3 vala

DESCRIPTION="Vala/Gtk+ graphical user interface for Tox"

HOMEPAGE="http://wiki.tox.im/Venom"
EGIT_REPO_URI="https://github.com/naxuroqa/Venom.git"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="+libnotify qrcode"

DEPEND="dev-libs/json-glib
		dev-db/sqlite
		qrcode? ( >=media-gfx/qrencode-3.3.1 )
		net-libs/tox
		>=x11-libs/gtk+-3.4:3
		libnotify? ( x11-libs/libnotify )
		$(vala_depend)"
RDEPEND="${DEPEND}"

src_configure() {
		local mycmakeargs=(
			$(cmake-utils_use_enable qrcode QR_ENCODE )
			$(cmake-utils_use_enable libnotify LIBNOTIFY )
		)

		cmake-utils_src_configure
}

pkg_postinst() {
		elog "Ebuild tracks master branch of Venom, which currently"
		elog "does not contain A/V support."
}
