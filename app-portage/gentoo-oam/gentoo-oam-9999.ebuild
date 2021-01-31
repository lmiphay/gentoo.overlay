# Copyright 1999-2021 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )

inherit user distutils-r1 bash-completion-r1 git-r3

DESCRIPTION="Automatation for common tasks around gentoo server upkeep"
HOMEPAGE="https://github.com/lmiphay/gentoo-oam"
EGIT_REPO_URI="https://github.com/lmiphay/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+completion +lnav +ranger"

# >=bash-4.3 is needed for 'local -n / declare -n'
RDEPEND="
	${PYTHON_DEPS}
	lnav? ( app-admin/lnav )
	app-admin/logrotate
	app-misc/screen
	ranger? ( app-misc/ranger )
	app-portage/genlop
	app-portage/gentoolkit
	app-portage/portage-utils
	>=app-shells/bash-4.3
	completion? ( app-shells/bash-completion )
	app-text/multitail
	dev-lang/perl
	dev-python/attrdict
	dev-python/click
	dev-python/eliot
	dev-python/eliot-tree
	dev-python/inotifyx
	dev-python/invoke
	dev-python/jinja
	dev-python/psutil
	dev-python/pyyaml
	sys-apps/moreutils[perl]
	sys-fs/inotify-tools
	virtual/python-enum34
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"

DOCS="README.md"

pkg_setup() {
	enewgroup oam
}

src_install() {
	   emake DESTDIR="${D}" install
	   dodoc ${DOCS}
	   distutils-r1_src_install
	   newbashcomp etc/bash.completion oam
}

src_test() {
	true
}
