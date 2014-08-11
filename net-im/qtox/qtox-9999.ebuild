# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="qTox"
HOMEPAGE="https://github.com/tux3/qtox"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="pulseaudio"

EGIT_REPO_URI="git://github.com/tux3/qtox.git"

DEPEND="
        >=sys-devel/gcc-4.8.0
        dev-qt/qtcore:5
        dev-qt/qtgui:5
        pulseaudio? ( 
                dev-qt/qtmultimedia:5[-alsa,pulseaudio,widgets]
)
        !pulseaudio? ( 
                dev-qt/qtmultimedia:5[alsa,-pulseaudio,widgets]
)
        dev-qt/qtconcurrent:5
        dev-qt/qtxml:5
        dev-qt/qtopengl:5
        net-libs/tox[av]
"

RDEPEND="
        ${DEPEND}
        media-plugins/gst-plugins-meta:0.10[opus,vpx,v4l]"

src_configure() {
        if use x86; then
                /usr/lib/qt5/bin/qmake
        elif use amd64; then
                /usr/lib64/qt5/bin/qmake
        else
                die "Not supported arch"
        fi
}

src_install() {
        dobin "${S}/qtox" || die "qTox not found!"
        doicon -s scalable "${FILESDIR}"/tox.svg
        make_desktop_entry "qtox" "qTox" "/usr/share/icons/hicolor/scalable/apps/tox.svg" "Network"
}

