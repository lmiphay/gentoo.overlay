# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm

DESCRIPTION="A fully customisable desktop menu for plasma 5"
HOMEPAGE="https://sourceforge.net/projects/plasma-custom-desktop-menu"
SRC_URI="mirror://sourceforge/${PN}/plasma-containmentactions-customdesktopmenu-${PV}.tar.gz"
# Also at:
# http://kde-apps.org/content/show.php?action=content&content=171299
# https://github.com/MatMoul/plasma-containmentactions-customdesktopmenu

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	kde-plasma/plasma-workspace
"
DEPEND="${RDEPEND}
"
S="${WORKDIR}/plasma-containmentactions-customdesktopmenu"

src_install() {
	default
	dodoc "${FILESDIR}/example.config"
	insinto /usr/lib64/qt5/plugins
	doins ${WORKDIR}/plasma-containmentactions-customdesktopmenu_build/bin/plasma_containmentactions_customdesktopmenu.so
	insinto /usr/share/kservices5
	doins plasma-containmentactions-customdesktopmenu.desktop
}

pkg_postinst() {
	elog "To enable this launcher:"
	elog ""
	elog "   Run: kbuildsycoca5"
	elog ""
	elog "   Right click to your desktop and select Desktop Settings."
	elog "   On mouse actions, you can now choose Custom Desktop Menu."
	elog ""
	elog "   If new menu is not available, logout/login your session."
	elog ""
	elog "   Configure in: <Right-Click>->Desktop Settings->Mouse Actions->Custom Desktop Menu [Config]"
	elog "   See installed doc: example.config"
}
