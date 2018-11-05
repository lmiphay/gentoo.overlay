# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit readme.gentoo-r1

DESCRIPTION="Bridging docker containers to an external network"
HOMEPAGE="https://github.com/lmiphay/docker-link"
SRC_URI="https://github.com/lmiphay/docker-link/archive/v0.1.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}
	app-shells/bash
"

DISABLE_AUTOFORMATTING=1
FORCE_PRINT_ELOG=1
DOC_CONTENTS="
  This is an experimental attempt at bridging docker containers to an external network

  Please report issues at the bug tracker: https://github.com/lmiphay/docker-link/issues
"

src_install() {
	dobin docker-link
	dodoc README.md

	readme.gentoo_create_doc

	default
}

pkg_postinst() {
	readme.gentoo_print_elog
}
