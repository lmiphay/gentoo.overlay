# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="Automatation for common tasks around gentoo server upkeep"
HOMEPAGE="https://github.com/lmiphay/gentoo-oam"
SRC_URI="https://github.com/lmiphay/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lnav +ranger"

# >=bash-4.3 is needed for 'local -n / declare -n'
RDEPEND="
	app-admin/eclean-kernel
	lnav? ( app-admin/lnav )
	app-admin/logrotate
	app-misc/screen
	ranger? ( app-misc/ranger )
	app-portage/eix
	app-portage/genlop
	app-portage/gentoolkit
	app-portage/portage-utils
	>=app-shells/bash-4.3
	app-text/multitail
	dev-lang/perl
	sys-apps/moreutils[perl]
	sys-fs/inotify-tools
	sys-process/mussh
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
