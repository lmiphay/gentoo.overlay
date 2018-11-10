# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="A platform independent file lock"
HOMEPAGE="https://github.com/benediktschmitt/py-filelock"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND=""
