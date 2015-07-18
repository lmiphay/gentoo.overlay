# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Automatation for common tasks around gentoo server upkeep"
HOMEPAGE="https://github.com/lmiphay/gentoo-oam"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lnav +ranger"

RDEPEND="
	app-admin/eclean-kernel
	lnav? ( app-admin/lnav )
	app-admin/logrotate
	app-crypt/johntheripper
	ranger? ( app-misc/ranger )
	app-portage/eix
	app-portage/genlop
	app-portage/gentoolkit
	app-portage/portage-utils
	app-text/multitail
	dev-lang/perl
	sys-apps/moreutils[perl]
	sys-fs/inotify-tools
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
