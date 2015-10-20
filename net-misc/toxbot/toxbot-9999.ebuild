# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils git-2 toolchain-funcs

DESCRIPTION="Tox groupchats bot"
HOMEPAGE="https://github.com/JFreegman/ToxBot"
SRC_URI=""
EGIT_REPO_URI="git://github.com/JFreegman/ToxBot.git
	https://github.com/JFreegman/ToxBot.git"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-libs/tox[av]"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	# Verbose build
	sed -i \
			-e 's/@$(CC)/$(CC)/' \
			Makefile || die
	epatch_user
}

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		USER_CFLAGS="${CFLAGS}" \
		USER_LDFLAGS="${LDFLAGS}"
}

src_install() {
	dobin "${S}/toxbot"
}
