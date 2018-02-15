# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_{4,5,6})

inherit distutils-r1

DESCRIPTION="Generate secure multiword passwords/passphrases, inspired by XKCD"
HOMEPAGE="https://github.com/redacted/XKCD-password-generator"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
#https://github.com/redacted/XKCD-password-generator/archive/xkcdpass-1.14.3.tar.gz

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
