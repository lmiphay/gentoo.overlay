# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=INGY
DIST_VERSION=0.0.2
inherit perl-module

DESCRIPTION="Diff 2 YAML Documents Semantically"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	dev-perl/IO-All
	dev-perl/Mo
	dev-perl/Module-Build
	dev-perl/YAML-LibYAML
"

RESTRICT="mirror"
