# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Memory Efficient Serialization Library"
HOMEPAGE="http://google.github.io/flatbuffers/"
SRC_URI="https://github.com/google/${PN}/archive/v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="-doc -examples -java"

RDEPEND="
	java? ( virtual/jdk:* )
"
DEPEND="
	${RDEPEND}
"
src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile

	if use java ; then
	   (cd java && \
		javac com/google/flatbuffers/*.java && \
		jar cf flatbuffers.jar com/google/flatbuffers/*.class)
	fi
}

src_install() {
	cmake-utils_src_install

	insinto /usr/include
	doins -r include/flatbuffers

	if use doc ; then
		dohtml -r docs
	fi

	if use examples ; then
		dodoc -r samples
	fi

	if use java ; then
	   insinto /usr/share/${PN}
	   doins java/flatbuffers.jar
	fi
}
