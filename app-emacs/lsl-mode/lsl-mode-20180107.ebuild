# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp git-r3

DESCRIPTION="Major mode for editing Linden Scripting Language"
HOMEPAGE="http://www.buildersbrewery.com/"

EGIT_REPO_URI="https://github.com/buildersbrewery/linden-scripting-language.git"
EGIT_COMMIT="120b7ebd905a81df9dc9c2c32a40bc399a42112e"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-emacs/yasnippet"
DEPEND="${RDEPEND}"

DOCS="README.md"

S="${WORKDIR}/${P}/emacs"

src_install() {
	insinto /usr/share/emacs/etc/yasnippet-snippets
	doins -r yasnippet/snippets/lsl-mode
	elisp_src_install
}
