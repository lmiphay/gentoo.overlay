# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{8,9})

inherit eutils distutils-r1 git-r3

DESCRIPTION="OpenAPI client & converter in python: type-safe, dynamic, spec-compliant"
HOMEPAGE="https://github.com/mission-liao/pyswagger"
EGIT_REPO_URI="https://github.com/mission-liao/pyswagger.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/pretty-yaml-15.5.7
	dev-python/requests
	dev-python/six
	dev-python/validate_email
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
