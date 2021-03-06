# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)

inherit eutils distutils-r1

DESCRIPTION="Generate pip requirements.txt file based on imports of any project"
HOMEPAGE="https://github.com/bndr/pipreqs"
SRC_URI="https://github.com/bndr/pipreqs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/docopt[${PYTHON_USEDEP}]
	dev-python/yarg[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
