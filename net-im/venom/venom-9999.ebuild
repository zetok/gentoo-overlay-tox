# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-r3 vala

DESCRIPTION="Vala/Gtk+ graphical user interface for Tox"

HOMEPAGE="https://github.com/naxuroqa/Venom"
EGIT_REPO_URI="git://github.com/naxuroqa/Venom.git
			   https://github.com/naxuroqa/Venom.git"
EGIT_COMMIT="599e1cb038f1b499c165b9a2bf6228dd08462068"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/glib:2
		dev-libs/libgee:0.8
		net-im/tox-core
		x11-libs/gtk+:3
		$(vala_depend)"
RDEPEND="${DEPEND}"
