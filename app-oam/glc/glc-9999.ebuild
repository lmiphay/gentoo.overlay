# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1 git-r3

DESCRIPTION="gentoo linux container producer"
HOMEPAGE="https://github.com/lmiphay/glc"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
	app-crypt/gnupg
	app-crypt/rhash
	app-emulation/lxc[python,${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/invoke-0.21.0[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	net-misc/wget
	sys-apps/coreutils
"
DEPEND="
	test? (
		>=dev-python/coverage-4.2[${PYTHON_USEDEP}]
		>=dev-python/flake8-2.5.4[${PYTHON_USEDEP}]
		>=dev-python/mock-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pylint-1.6.5[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/sphinx-1.6.3[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"

src_test() {
	./runtests.sh || die
}
