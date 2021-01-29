# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PY_SEMANTIK="3.8"
PYTHON_COMPAT=( python3_8 )

inherit ecm distutils-r1 git-r3

DESCRIPTION="A mind-mapping application for KDE"
HOMEPAGE="https://waf.io/semantik.html"
EGIT_REPO_URI="https://gitlab.com/ita1024/semantik.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	kde-frameworks/kio
	dev-qt/qtpositioning
	dev-qt/qtsvg
	dev-qt/qtwebengine[widgets]
	dev-lang/python:${PY_SEMANTIK}
	dev-python/pygments[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
"

#S="${WORKDIR}/plasma-containmentactions-customdesktopmenu"

src_configure() {
	./waf configure --prefix=/usr --libdir=/usr/lib64 || die
}

src_compile() {
	./waf build || die
}

src_install() {
	DESTDIR="${D}" ./waf install --noldconfig --nomimes --nogtkicons || die
}
