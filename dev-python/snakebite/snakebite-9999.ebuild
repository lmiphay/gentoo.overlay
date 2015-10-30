# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python2_7)

inherit eutils distutils-r1 git-r3

DESCRIPTION="A pure python HDFS client"
HOMEPAGE="https://github.com/spotify/snakebite"
EGIT_REPO_URI="https://github.com/spotify/snakebite.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	dev-libs/protobuf[python]
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
