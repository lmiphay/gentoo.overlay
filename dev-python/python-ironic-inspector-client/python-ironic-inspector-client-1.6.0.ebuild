# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=(python{2_7,3_4})

inherit distutils-r1

DESCRIPTION="A client library and tool for Ironic Inspector"
HOMEPAGE="https://launchpad.net/python-ironic-inspector-client"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/cliff-2.0.0
	>=dev-python/oslo-i18n-2.1.0
	>=dev-python/oslo-utils-3.5.0
	>=dev-python/pbr-1.6.0
	>=dev-python/python-keystoneclient-1.6.0
	>=dev-python/python-openstackclient-2.1.0
	>=dev-python/requests-2.8.1
	>=dev-python/six-1.9.0
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
