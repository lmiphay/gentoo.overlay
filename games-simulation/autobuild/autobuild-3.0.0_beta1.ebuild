# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit eutils distutils-r1 git-r3

DESCRIPTION="A framework for building packages and for managing the dependencies"
HOMEPAGE="https://bitbucket.org/lindenlab/autobuild/src/v3/"
EGIT_REPO_URI="https://bitbucket.org/lindenlab/autobuild.git"
EGIT_COMMIT="b15f569fca7bbfa8050a7723c32476eddcdf9ba9"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/pydot[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	games-simulation/llbase[${PYTHON_USEDEP}]
	${RDEPEND}
"

extras_require={"dev": ["nose"]},

DOCS="README.md"

distutils_enable_tests nose
