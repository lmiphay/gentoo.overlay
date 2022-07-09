# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=SAMPO
DIST_VERSION=1.19
inherit perl-module

DESCRIPTION="pure Perl implementation of SMPP 3.4 over TCP"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	dev-perl/Module-Build
"

RESTRICT="mirror"
