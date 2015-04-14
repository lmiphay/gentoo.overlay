# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Wrapper around rdumpfs to automate daily/weekly/monthly backups"
HOMEPAGE="https://github.com/lmiphay/rdumpfs-rota"
EGIT_REPO_URI="https://github.com/lmiphay/rdumpfs-rota.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	app-backup/rdumpfs
"
DEPEND="${RDEPEND}
"

DOCS="README.md"
