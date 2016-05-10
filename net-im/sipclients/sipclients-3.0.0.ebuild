# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1

DESCRIPTION=""
HOMEPAGE="https://github.com/AGProjects/sipclients"
SRC_URI="https://github.com/AGProjects/sipclients/archive/release-3.0.0.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/python-sipsimple-2.5.1-r3
	virtual/ffmpeg[x264]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

S="${WORKDIR}/${PN}-release-${PV}"
