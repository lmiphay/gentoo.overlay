# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

MY_PN="cidr_trie"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Store/search CIDR prefixes in a trie structure"
HOMEPAGE="https://github.com/Figglewatts/cidr-trie https://pypi.org/project/cidr-trie/"
SRC_URI="mirror://pypi/${MY_P:0:1}/${MY_PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README.rst"

S="${WORKDIR}/${MY_P}"
