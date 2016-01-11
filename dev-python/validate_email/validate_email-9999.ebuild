# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_{3,4}})

inherit eutils distutils-r1 git-r3

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
