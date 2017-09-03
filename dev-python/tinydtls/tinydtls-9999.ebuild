# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python3_4)

inherit eutils autotools distutils-r1 flag-o-matic git-r3

DESCRIPTION="tinydtls for Cython"
HOMEPAGE="https://git.fslab.de/jkonra2m/tinydtls"
EGIT_REPO_URI="https://git.fslab.de/jkonra2m/tinydtls.git"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README"

# install recipe taken from:
#    https://github.com/ggravlingen/pytradfri/blob/master/script/install-aiocoap.sh

CYTHONSRC="${WORKDIR}/${P}/cython"

python_prepare() {
	eautoreconf
}

python_configure() {
	econf \
		--with-ecc \
		--without-debug
}

python_compile() {
	append-cppflags "-I${WORKDIR}/${P}-python3_4 -I${WORKDIR}/${P}-python3_4/sha2"
	(cd "${CYTHONSRC}" && esetup.py build)
}

python_install() {
	(cd "${CYTHONSRC}" && esetup.py install)
}
