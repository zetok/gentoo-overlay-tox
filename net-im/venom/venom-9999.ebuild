# Copyright 1999-2013 Gentoo Foundation
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
IUSE=""

DEPEND="dev-libs/libgee:0.8
		dev-libs/json-glib
		net-libs/tox
		x11-libs/gtk+:3
		$(vala_depend)"
RDEPEND="${DEPEND}"
