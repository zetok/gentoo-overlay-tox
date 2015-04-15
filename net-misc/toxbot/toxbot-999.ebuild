# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2 toolchain-funcs

DESCRIPTION="Tox groupchats bot"
HOMEPAGE="https://github.com/JFreegman/ToxBot"
SRC_URI=""
EGIT_REPO_URI="git://github.com/JFreegman/ToxBot.git"

# workaround until all clients are on new api
EGIT_COMMIT="acfabb8ca43d1eb7542719ffc0884a7fb91550af"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="net-libs/tox[av]"

RDEPEND="${DEPEND}
	virtual/pkgconfig"

src_prepare() {
	# verbose build
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

