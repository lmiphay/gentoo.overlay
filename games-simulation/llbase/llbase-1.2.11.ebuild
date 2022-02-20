# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_9)
DISTUTILS_USE_SETUPTOOLS=rdepend

inherit eutils distutils-r1 git-r3

DESCRIPTION="Utility modules used from Linden Lab"
HOMEPAGE="https://bitbucket.org/lindenlab/llbase/src/master/"
EGIT_REPO_URI="https://bitbucket.org/lindenlab/llbase.git"
EGIT_COMMIT="85b2b7d38f91e1c1f76cf742f26d5cdc9e0e1ced"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/nose[${PYTHON_USEDEP}]
	)
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"

distutils_enable_tests nose
