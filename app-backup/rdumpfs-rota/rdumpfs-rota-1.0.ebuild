# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit eutils

DESCRIPTION="Wrapper around rdumpfs to automate daily/weekly/monthly backups"
HOMEPAGE="https://github.com/lmiphay/rdumpfs-rota"
SRC_URI="https://github.com/lmiphay/rdumpfs-rota/archive/v1.0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-admin/logrotate
	app-backup/rdumpfs
	virtual/cron
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
