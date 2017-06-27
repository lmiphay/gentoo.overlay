# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_4)

inherit eutils distutils-r1 bash-completion-r1 git-r3

DESCRIPTION="Pythonic task management & command execution"
HOMEPAGE="http://pyinvoke.org"
EGIT_REPO_URI="https://github.com/pyinvoke/invoke.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	test? ( dev-python/spec dev-python/mock dev-python/flake8 )
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.rst"
PATCHES=( \
		"${FILESDIR}/loader-sys-path.patch" \
		"${FILESDIR}/encode-fallback.patch" \
		"${FILESDIR}/files-in-config.patch" \
		"${FILESDIR}/capture-buffer-size.patch" \
)

src_install() {
	dodoc ${DOCS}
	distutils-r1_src_install
	newbashcomp completion/bash "${PN}"
	newbashcomp completion/bash inv
}

src_test() {
	flake8 --verbose --config="${S}"/setup.cfg "${S}"/invoke
	spec --where="${S}"/tests
}
