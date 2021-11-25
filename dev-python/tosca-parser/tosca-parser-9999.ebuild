# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )

inherit eutils distutils-r1 git-r3

DESCRIPTION="Parser for TOSCA Simple Profile in YAML"
HOMEPAGE="https://github.com/openstack/tosca-parser"
EGIT_REPO_URI="https://opendev.org/openstack/tosca-parser.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# tests fail while trying to fetch collateral from github.com
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/Babel[${PYTHON_USEDEP}]
	dev-python/cliff[${PYTHON_USEDEP}]
	dev-python/pbr[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/stevedore[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		  dev-python/stestr
	)
"

src_prepare() {
	sed -i -e 's;author-email;author_email;' "setup.cfg"
	sed -i -e 's;description-file;description_file;' "setup.cfg"
	sed -i -e 's;home-page;home_page;' "setup.cfg"
	sed -i -e 's;python-requires;python_requires;' "setup.cfg"

	eapply_user
}

python_test() {
	stestr run --slowest || die "Tests fail with ${EPYTHON}"
}
