# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python2_7 python3_6 )

inherit distutils-r1

DESCRIPTION="Summarizes the contents of a syslog log file"
HOMEPAGE="https://github.com/dpaleino/syslog-summary"
SRC_URI="mirror://github/dpaleino/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~sparc ~x86"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
DEPEND=""
RDEPEND="${PYTHON_DEPS}"

python_prepare_all() {
	eapply "${FILESDIR}/${PN}-py3.diff"

	cp "${FILESDIR}/${PN}-setup.py" setup.py || die "Copying of setup.py failed"

	sed -i -e 's:python-magic:sys-apps/file[python]:' "syslog-summary" || die

	# Sadly, the makefile is useless for us.
	rm Makefile || die

	mv syslog-summary syslogsummary.py
	distutils-r1_python_prepare_all
}

python_install_all() {
	einstalldocs
	doman syslog-summary.1

	insinto /etc/syslog-summary
	doins ignore.rules

	distutils-r1_python_install_all
}

pkg_postinst() {
	elog "install sys-apps/file[python] to enable processing"
	elog "of gzip compressed logfiles"
}
