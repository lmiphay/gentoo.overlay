# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{12..13})

inherit distutils-r1

DESCRIPTION="Keyboard Status Monitor"
HOMEPAGE="https://github.com/scottkirkwood/key-mon"
SRC_URI="https://github.com/scottkirkwood/key-mon/releases/download/${PV}/${P}.tar.gz"
#		 https://github.com/scottkirkwood/key-mon/releases/download/1.20/key-mon-1.20.tar.gz

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	gnome-base/librsvg
	dev-python/pygtk:2
	dev-python/python-xlib
	x11-proto/recordproto
	x11-libs/gtk+"
RDEPEND="${DEPEND}"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_prepare() {
	python_convert_shebangs 2 src/${PN}
	python_convert_shebangs 2 src/keymon/*.py
}

src_install() {

	insinto /usr/share/${PN}
	doins -r src/*
	fperms 755 /usr/share/${PN}/${PN}
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
	doman man/${PN}.1
	newdoc README.rst README
	domenu icons/${PN}.desktop

	insinto /usr/share/mime/packages/
	doins icons/${PN}.xpm
}
