# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils git-2 user systemd

DESCRIPTION="Encrypted P2P, messenging, and audio/video calling platform"
HOMEPAGE="https://tox.im"
SRC_URI=""
EGIT_REPO_URI="https://github.com/irungentoo/toxcore"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+av daemon log log-debug log-error log-info log-trace log-warn ntox static-libs test"

RDEPEND="
	>=dev-libs/libsodium-0.6.1[urandom,asm]
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
		if use !log ; then
			ewarn "Logging disabled, but log level set,"
			ewarn "it will have no effect."
		else
			use log-trace && loglevel=" TRACE"
			use log-debug && loglevel="${loglevel} DEBUG"
			use log-info && loglevel="${loglevel} INFO"
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
		$(use_enable log) \
		$(usex log "--with-log-level=${loglevel##* }" "") \
		$(use_enable av) \
		$(use_enable test tests) \
		$(use_enable ntox) \
		$(use_enable daemon) \
		$(use_enable static-libs static)
}

src_install() {
	default
	use daemon && { newinitd "${FILESDIR}"/initd tox-dht-daemon
		newconfd "${FILESDIR}"/confd tox-dht-daemon
		insinto /etc
		doins "${FILESDIR}"/tox-bootstrapd.conf
		systemd_dounit "${FILESDIR}"/tox-bootstrapd.service ; }
	prune_libtool_files
}

pkg_postinst() {
	use daemon && {	enewgroup ${PN}
		enewuser ${PN} -1 -1 -1 ${PN} ; }
}

