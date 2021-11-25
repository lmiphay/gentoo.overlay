# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils git-r3

DESCRIPTION="Display stack trace of a running process."
HOMEPAGE="https://packages.debian.org/source/sid/pstack"
EGIT_REPO_URI="https://salsa.debian.org/debian/${PN}.git"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

PATCHES=( "${FILESDIR}/${PN}.ignore-linux-vdso.patch" )
