# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=(python3_{8,9})

inherit eutils distutils-r1 git-r3

DESCRIPTION="Kafka Python client"
HOMEPAGE="https://github.com/mumrah/kafka-python"
EGIT_REPO_URI="https://github.com/mumrah/kafka-python.git"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
	net-misc/kafka-bin
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
