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
IUSE=""

RDEPEND="
	app-admin/logrotate
	app-portage/eix
	app-portage/genlop
	app-portage/gentoolkit
	app-text/multitail
	dev-lang/perl
	sys-apps/moreutils[perl]
	sys-fs/inotify-tools
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
