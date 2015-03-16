# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-UPnP/Net-UPnP-1.4.2.ebuild,v 1.8 2011/04/24 16:06:07 grobian Exp $

EAPI=5

MODULE_AUTHOR=NJH
#MODULE_VERSION=0.0.7
inherit perl-module

DESCRIPTION="Perl extension for SDP"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="virtual/perl-Module-Build ${RDEPEND}"

SRC_TEST="skip"

