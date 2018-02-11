# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit readme.gentoo-r1 eutils git-r3

DESCRIPTION="logitechmediaserver process cleanup and restarter"
HOMEPAGE="https://github.com/lmiphay/lms-restart"
EGIT_REPO_URI="https://github.com/lmiphay/lms-restart.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-sound/logitechmediaserver-bin
"

DISABLE_AUTOFORMATTING=1
FORCE_PRINT_ELOG=1
DOC_CONTENTS="
  This is a simple bouncer for logitechmediaserver.

  Note it is configured to run once a day - you may want to pick/configure
  a specific time.
"

src_install() {
	dobin lms-restart

	insinto /etc/cron.daily
	newins lms-restart.cron lms-restart
	fperms 755 "/etc/cron.daily/lms-restart"

	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}
