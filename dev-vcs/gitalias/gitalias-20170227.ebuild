# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils bash-completion-r1 git-r3

DESCRIPTION="Git alias commands for faster easier version control"
HOMEPAGE="https://github.com/GitAlias/gitalias"
EGIT_REPO_URI="https://github.com/GitAlias/gitalias.git"
EGIT_COMMIT="bccc9cd4c76edc799779b75bc3b6cfba57551634"

LICENSE="Unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
"
RDEPEND="${DEPEND}
	dev-vcs/git
"

src_install() {
	dodoc README.md

	insinto /usr/share/${PN}
	doins "${PN}.txt"

	# there is already a completion installed by git itself, so:
	# newbashcomp bash_completion ${PN}
	doins "bash_completion"
}

pkg_postinst() {
	elog "Now copy /usr/share/${PN}/${PN}.txt into your own .gitconfig"
}
