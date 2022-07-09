# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DIST_AUTHOR=DCONWAY
DIST_VERSION=v0.0.3
inherit perl-module

DESCRIPTION="A simple log file via a special filehandle"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="dev-perl/Module-Build"

RESTRICT="mirror"
