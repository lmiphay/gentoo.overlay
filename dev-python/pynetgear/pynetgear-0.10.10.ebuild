# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1

DESCRIPTION="Python library to control Netgear wireless routers through the SOAP-api"
HOMEPAGE="https://github.com/MatMaul/pynetgear"
SRC_URI="https://github.com/MatMaul/${PN}/archive/refs/tags/0.10.9.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"

src_prepare() {
	# setup.py opens up requirements.txt (which isn't shipped) and fails the
	# install - so remove references to it:
	sed -i '19d;7,8d' "setup.py"

	sed -i -e 's;description-file;description_file;' "setup.cfg"

	eapply_user
}
