# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Wrapper around rdumpfs to automate daily/weekly/monthly backups"
HOMEPAGE="https://github.com/lmiphay/rdumpfs-rota"
EGIT_REPO_URI="https://github.com/lmiphay/rdumpfs-rota.git"

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
