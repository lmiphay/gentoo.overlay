# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_12 )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

MY_PN="cidr_trie"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Store/search CIDR prefixes in a trie structure"
HOMEPAGE="https://github.com/Figglewatts/cidr-trie https://pypi.org/project/cidr-trie/"
SRC_URI="$(pypi_sdist_url cidr-trie)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README.rst"

S="${WORKDIR}/${MY_P}"
