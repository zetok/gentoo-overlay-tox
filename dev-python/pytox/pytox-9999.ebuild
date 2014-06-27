# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/ws4py/ws4py-9999.ebuild,v 1.4 2012/07/17 02:11:37 vapier Exp $

# The gevent package isn't in the tree yet, so we delete
# those implementations.
#
# We could depend on dev-python/cherrypy when USE=server, but
# that is an optional component ...
# Same for www-servers/tornado and USE=client ...

EAPI="4"
PYTHON_COMPAT=( python{2_6,2_7,3_3} )

inherit distutils eutils

if [[ ${PV} == "9999" ]] ; then
	inherit git-2
	EGIT_REPO_URI="https://github.com/aitjcize/PyTox.git"
else
	SRC_URI="https://github.com/aitjcize/PyTox/archive/${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Python bindings for the Tox library"
HOMEPAGE="https://github.com/aitjcize/PyTox"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="net-libs/tox"
DEPEND="${RDEPEND}"
