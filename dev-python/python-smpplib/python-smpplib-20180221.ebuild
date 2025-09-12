# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{12..13})

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 git-r3

DESCRIPTION="SMPP library for python"
HOMEPAGE="https://github.com/podshumok/python-smpplib"
EGIT_REPO_URI="https://github.com/podshumok/python-smpplib.git"
EGIT_COMMIT="f6b0a8529f3973110bcc999a706666703e6c3a2b"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"

src_prepare() {
	sed -i -e 's;packages=find_packages();packages=find_packages(exclude=["tests"]);' "setup.py"
	eapply_user
}
