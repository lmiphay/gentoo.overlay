# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{8,9})

inherit eutils distutils-r1

DESCRIPTION="Package and upload Python lambda functions to AWS"
HOMEPAGE="https://github.com/rackerlabs/lambda-uploader"
SRC_URI="https://github.com/rackerlabs/lambda-uploader/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="mirror"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/boto3-1.4.0[${PYTHON_USEDEP}]
"
DEPEND="
	test? ( dev-python/pytest dev-python/flake8 )
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"

src_test() {
	py.test --verbose
	flake8 lambda_uploader "${S}"/setup.py --statistics
}
