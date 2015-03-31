# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=ADDUTKO
inherit perl-module

DESCRIPTION="Perl Bluetooth Interface"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	net-wireless/bluez
	virtual/perl-Module-Build
"

SRC_TEST="skip"
RESTRICT="mirror"
