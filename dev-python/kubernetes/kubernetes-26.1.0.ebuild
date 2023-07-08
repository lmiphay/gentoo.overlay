# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_11 )
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit distutils-r1

DESCRIPTION="Kubernetes python client"
HOMEPAGE="https://github.com/kubernetes-client/python"
SRC_URI="https://github.com/kubernetes-client/python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
#         https://github.com/kubernetes-client/python/archive/refs/tags/v26.1.0.tar.gz
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# restrict test for now - missing test deps:
#  randomize
#  sphinx_markdown_tables
#  codecov
RESTRICT="test"

CDEPEND="
	>=dev-python/certifi-14.05.14[${PYTHON_USEDEP}]
	>=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	>=dev-python/google-auth-1.0.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/ipaddress-1.0.17[${PYTHON_USEDEP}]' python2_7)
	>=dev-python/websocket-client-0.32.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/requests-oauthlib[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.24.2[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage
		dev-python/nose
		dev-python/pytest
		dev-python/pytest-cov
		dev-python/pluggy
		dev-python/py
		dev-python/sphinx
		dev-python/recommonmark
		dev-python/pycodestyle
		dev-python/autopep8
		dev-python/isort
	)
"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
RDEPEND="${CDEPEND}"

distutils_enable_tests pytest
