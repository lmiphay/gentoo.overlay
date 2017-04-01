# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Manager of SSH ControlMaster connections"
HOMEPAGE="https://github.com/ClockworkNet/cmc"
EGIT_REPO_URI="https://github.com/ClockworkNet/cmc.git"
EGIT_COMMIT="433bf82dbcbfe0a64c1d3bbcd77baf82d495019b"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=app-shells/bash-3.0
	net-misc/openssh
"
DEPEND="${RDEPEND}
"

DOCS="README.rst docs/annotated_config.rst docs/workflow.rst"

src_install() {
	dobin cmc
	dodoc ${DOCS}
}
