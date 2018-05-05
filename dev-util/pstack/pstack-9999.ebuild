# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils git-r3

DESCRIPTION="Display stack trace of a running process."
HOMEPAGE="https://packages.debian.org/source/sid/pstack"
EGIT_REPO_URI="https://anonscm.debian.org/git/collab-maint/${PN}.git"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

src_prepare() {
	epatch "${FILESDIR}/${PN}.ignore-linux-vdso.patch"
	eapply_user
}
