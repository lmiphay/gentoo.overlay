# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MODULE_AUTHOR=NJH
inherit perl-module

DESCRIPTION="Perl extension for SDP"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-perl/Module-Build ${RDEPEND}"

SRC_TEST="skip"
RESTRICT="mirror"
