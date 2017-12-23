# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=(python2_7 python3_6)

inherit readme.gentoo-r1 eutils python-single-r1

DESCRIPTION="Squeezebox integration for Amazon Alexa"
HOMEPAGE="https://github.com/declension/squeeze-alexa"
SRC_URI="https://github.com/declension/squeeze-alexa/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="mirror"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/awscli[${PYTHON_USEDEP}]
	=dev-python/fuzzywuzzy-0.12.0[${PYTHON_USEDEP}]
	dev-python/lambda-uploader[${PYTHON_USEDEP}]
	net-analyzer/nmap[ncat]
	net-misc/stunnel
"
DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
	)
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="
	README.md
	docs/HOWTO.md
	docs/TROUBLESHOOTING.md
	docs/squeeze-alexa-networking.png
	docs/squeeze-alexa-networking.xml
	etc/stunnel.conf
"

DISABLE_AUTOFORMATTING=1
DOC_CONTENTS="
Support thread at:
	http://forums.slimdevices.com/showthread.php?107009-Announce-squeeze-alexa-DIY-secure-Alexa-integration
"
src_install() {
	python_domodule squeezealexa
	python_newscript bin/local_test.py ${PN}-local-test

	dobin ${FILESDIR}/lms-status

	insinto "/usr/share/${PN}"
	doins \
		handler.py \
		lambda.json
	doins -r metadata squeezealexa

	dodoc ${DOCS}
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

python_test() {
	py.test -vv || die "Tests failed"
	flake8 --verbose --config="${S}"/setup.cfg "${S}"/squeezealexa
}
