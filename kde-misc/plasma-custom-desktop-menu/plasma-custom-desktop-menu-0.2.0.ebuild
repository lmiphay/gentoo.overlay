# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm

DESCRIPTION="Custom desktop menu for Plasma 6"
HOMEPAGE="https://github.com/MatMoul/plasma-containmentactions-customdesktopmenu"
SRC_URI="https://github.com/MatMoul/plasma-containmentactions-customdesktopmenu/archive/refs/tags/v${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
	>=kde-frameworks/extra-cmake-modules-6.0.0
	>=kde-plasma/kdeplasma-addons-6.0.0
	kde-plasma/plasma-workspace
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/plasma-containmentactions-customdesktopmenu-${PV}/src"

src_install() {
	default
	dodoc "${FILESDIR}/example.config"
	insinto /usr/lib64/qt6/plugins/plasma/containmentactions
	chmod a+x "${WORKDIR}/plasma-containmentactions-customdesktopmenu-${PV}/src_build/bin/plasma/containmentactions/matmoul-customdesktopmenu.so"
	doins "${WORKDIR}/plasma-containmentactions-customdesktopmenu-${PV}/src_build/bin/plasma/containmentactions/matmoul-customdesktopmenu.so"
}

pkg_postinst() {
	elog "To enable this launcher:"
	elog ""
	elog "   Run: kbuildsycoca6"
	elog ""
	elog "   Right click to your desktop and select 'Desktop and Wallpaper' settings."
	elog "   On Mouse Actions, you can now choose Custom Desktop Menu."
	elog ""
	elog "   If new menu is not available, logout/login your session."
	elog ""
	elog "   Configure in: <Right-Click>->'Desktop and Wallpaper' settings->Mouse Actions->Custom Desktop Menu [Config]"
	elog "   See installed doc: example.config"
}
