# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit eutils distutils-r1 git-r3

DESCRIPTION="Pythonic DBus library"
HOMEPAGE="https://github.com/LEW21/pydbus"
EGIT_REPO_URI="https://github.com/LEW21/pydbus.git"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-python/pygobject:3
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
