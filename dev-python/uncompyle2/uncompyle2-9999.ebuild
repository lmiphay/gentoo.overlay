# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 )

inherit git-r3 distutils-r1

DESCRIPTION="A Python 2.7 byte-code decompiler"
HOMEPAGE="https://github.com/wibiti/uncompyle2"
EGIT_REPO_URI="http://github.com/wibiti/uncompyle2.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
