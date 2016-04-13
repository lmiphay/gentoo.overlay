# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python{2_7,3_4})

inherit eutils distutils-r1 git-r3

DESCRIPTION="Parser for TOSCA Simple Profile in YAML"
HOMEPAGE="https://github.com/openstack/tosca-parser"
EGIT_REPO_URI="git://git.openstack.org/openstack/tosca-parser"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-python/Babel
	dev-python/cliff
	dev-python/pbr
	dev-python/python-dateutil
	dev-python/pyyaml
	dev-python/six
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

src_prepare () {
	epatch "${FILESDIR}/ignore-pyo.patch"
}
