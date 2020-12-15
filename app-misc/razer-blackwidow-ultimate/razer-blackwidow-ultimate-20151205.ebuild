# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )

inherit python-single-r1 git-r3

DESCRIPTION="Enable M1-M5/FN keys for the Razer BlackWidow Ultimate keyboard"
HOMEPAGE="https://github.com/lmiphay/razer-blackwidow-ultimate"
EGIT_REPO_URI="https://github.com/lmiphay/razer-blackwidow-ultimate.git"
EGIT_COMMIT="9e6bfe3c3995d882bd093a3f3fc020d2839541a9"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}
"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_prepare () {
	python_fix_shebang ${PN}.py
	sed -i -e \
		's:/usr/bin/razer-blackwidow-ultimate.py:/usr/sbin/razer-blackwidow-ultimate:' \
		"99-razer-blackwidow-ultimate.rules"
	eapply_user
}

src_install() {
	newsbin razer-blackwidow-ultimate.py razer-blackwidow-ultimate
	newsbin "${FILESDIR}/rbu" rbu
	dodoc ${FILESDIR}/Razer-Macros.Xmodmap
	insinto /lib/udev/rules.d

	# don't install this at the moment - its failing for some reason when called from udev
	# doins 99-razer-blackwidow-ultimate.rules

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
}
