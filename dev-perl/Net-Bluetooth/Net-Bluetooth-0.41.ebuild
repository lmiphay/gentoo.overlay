# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=ADDUTKO
inherit perl-module

DESCRIPTION="Perl Bluetooth Interface"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	net-wireless/bluez
	dev-perl/Module-Build
"

RESTRICT="mirror"
