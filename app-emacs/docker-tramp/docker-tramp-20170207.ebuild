# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="TRAMP integration for docker containers"
HOMEPAGE="https://github.com/emacs-pe/docker-tramp.el"

EGIT_REPO_URI="https://github.com/emacs-pe/docker-tramp.el.git"
EGIT_COMMIT="8e2b671eff7a81af43b76d9dfcf94ddaa8333a23"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="
	${RDEPEND}
"

DOCS="README.md"
