# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=(python2_7 python3_4)

inherit eutils distutils-r1 git-r3

DESCRIPTION="Pythonic task management & command execution"
HOMEPAGE="http://pyinvoke.org"
EGIT_REPO_URI="https://github.com/pyinvoke/invoke.git"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

src_prepare () {
	epatch "${FILESDIR}/loader-sys-path.patch"
	eapply_user
}
