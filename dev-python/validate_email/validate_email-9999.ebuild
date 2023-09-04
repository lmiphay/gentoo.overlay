# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_11)

inherit distutils-r1 git-r3

DESCRIPTION="verify if an email address is valid and really exists"
HOMEPAGE="https://github.com/syrusakbary/validate_email"
EGIT_REPO_URI="https://github.com/syrusakbary/validate_email.git"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/pydns
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
