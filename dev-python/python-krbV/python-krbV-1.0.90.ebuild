# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=(python2_7)

inherit distutils-r1

DESCRIPTION="Python extension module for Kerberos 5"
HOMEPAGE="https://fedorahosted.org/python-krbV/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	app-crypt/mit-krb5
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README krbV-code-snippets.py python-krbV-test.py"
