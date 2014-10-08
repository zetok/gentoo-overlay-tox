# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2

DESCRIPTION="Scripts for net-im/ratox"
HOMEPAGE="http://git.2f30.org/ratox"
EGIT_REPO_URI="git://git.2f30.org/ratox-nuggets
        http://git.2f30.org/ratox-nuggets"

LICENSE="ISC"
SLOT="0"
IUSE=""

RDEPEND="net-im/ratox"
DEPEND="${RDEPEND}"
INSTALLDIR="/usr/bin/"

src_prepare() {
        epatch_user
}

src_install() {
        insinto ${INSTALLDIR}
        doins -r rat-echo rat-remotemic rat-weather rat-weather-voice
        chmod 755 "${D}/${INSTALLDIR}/rat-echo"
        chmod 755 "${D}/${INSTALLDIR}/rat-remotemic"
        chmod 755 "${D}/${INSTALLDIR}/rat-weather"
        chmod 755 "${D}/${INSTALLDIR}/rat-weather-voice"
}

pkg_postinst() {
	elog "Installed the following into /usr/bin/"
	elog "rat-echo rat-remotemic rat-weather rat-weather-voice"
	elog "Make sure to run them in your Ratox directory"

}
