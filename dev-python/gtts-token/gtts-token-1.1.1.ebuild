# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1

MY_PN="gTTS-token"

DESCRIPTION="A python implementation of the token validation of Google Translate"
HOMEPAGE="https://github.com/Boudewijn26/gTTS-token"
SRC_URI="mirror://pypi/${PN:0:1}/${MY_PN}/${MY_PN}-${PV}.zip"
RESTRICT="mirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-python/requests[${PYTHON_USEDEP}]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"
S="${WORKDIR}/${MY_PN}-${PV}"
