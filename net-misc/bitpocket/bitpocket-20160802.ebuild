# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit git-r3

DESCRIPTION="DIY Dropbox or 2-way directory (r)sync with proper deletion"
HOMEPAGE="https://github.com/sickill/bitpocket"
EGIT_REPO_URI="https://github.com/sickill/bitpocket.git"
EGIT_COMMIT="7854553182dc932524eb240f6e856fd69e7f6a0f"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}"

src_install() {
	dobin "bin/${PN}"
	dodoc README.md
}
