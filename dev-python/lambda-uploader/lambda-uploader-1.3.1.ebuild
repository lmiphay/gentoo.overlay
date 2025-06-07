# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_12)

inherit distutils-r1

DESCRIPTION="Package and upload Python lambda functions to AWS"
HOMEPAGE="https://github.com/rackerlabs/lambda-uploader"
SRC_URI="https://github.com/rackerlabs/lambda-uploader/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="mirror test"

# Test failures due virtualenv failures.
# tests disabled on test deps due to circular dependencies and many other
# test failures.

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	<=dev-python/boto3-1.18.65[${PYTHON_USEDEP}]
	dev-python/botocore[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		  dev-python/coverage
		  dev-python/flake8
		  dev-python/moto
		  dev-python/nose
		  dev-python/pylint
		  dev-python/pytest[-test]
		  dev-python/virtualenv
		  dev-python/httpx[-test]
		  dev-python/iniconfig[-test]
		  dev-python/pluggy[-test]
		  dev-python/pytest-cov[-test]
		  dev-python/pythran[-test]
		  dev-python/scipy[-pythran]
		  dev-python/uvicorn[-test]
		  dev-python/webtest[-test]
		  dev-python/pyquery[-test]
		  dev-python/aiohttp[-test]
		  dev-python/async_timeout[-test]
		  dev-python/bottle[-test]
		  dev-python/pytest-localserver[-test]
		  dev-python/python-socks[-test]
		  dev-python/trio[-test]
		  dev-python/scipy[-test]
		  dev-python/moto[-test]
		  )
	${RDEPEND}
"

DOCS="README.rst"

python_test() {
	py.test --verbose
	flake8 lambda_uploader "${S}"/setup.py --statistics
}
