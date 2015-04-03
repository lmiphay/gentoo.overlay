# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=DCONWAY
MODULE_VERSION=v0.0.3
inherit perl-module

DESCRIPTION="A simple log file via a special filehandle"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	virtual/perl-Module-Build
"

SRC_TEST="skip"
RESTRICT="mirror"
