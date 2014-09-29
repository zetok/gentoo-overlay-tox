# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools git-2

DESCRIPTION="Encrypted P2P, messenging, and audio/video calling platform"
HOMEPAGE="https://tox.im"
SRC_URI=""
EGIT_REPO_URI="https://github.com/irungentoo/toxcore"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+av daemon logging log-debug log-error log-info log-warn ntox static-libs test"

RDEPEND="
	>=dev-libs/libsodium-1.0.0
	daemon? ( dev-libs/libconfig )
	av? ( media-libs/libvpx
		media-libs/opus )
	ntox? ( sys-libs/ncurses )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	test? ( dev-libs/check )"

pkg_setup() {
	unset loglevel

	if use log-info || use log-debug || use log-warn || use log-error ; then
		if use !logging ; then
			ewarn "Logging disabled, but log level set,"
			ewarn "it will have no effect."
		else
			use log-info && loglevel=" INFO"
			use log-debug && loglevel="${loglevel} DEBUG"
			use log-warn && loglevel="${loglevel} WARNING"
			use log-error && loglevel="${loglevel} ERROR"

			if [[ $(echo "${loglevel}" | sed 's/[A-Z]//g') =~ "  " ]] ; then
				ewarn "You have chosen multiple log levels,"
				ewarn "but only one can be applied. Picking the"
				ewarn "last one: ${loglevel##* }"
			fi
		fi
	fi
	[[ -z ${loglevel} ]] && loglevel=DEBUG
}

src_prepare() {
	epatch_user
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable logging) \
		$(usex logging "--with-logger-level=${loglevel##* }" "") \
		$(use_enable av) \
		$(use_enable test tests) \
		$(use_enable ntox) \
		$(use_enable daemon) \
		$(use_enable static-libs static)
}

src_install() {
	default
	use daemon && { newinitd "${FILESDIR}"/initd tox-dht-daemon
		newconfd "${FILESDIR}"/confd tox-dht-daemon ; }
	prune_libtool_files
}
