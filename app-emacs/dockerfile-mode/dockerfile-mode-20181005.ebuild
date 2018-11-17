# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp git-r3

DESCRIPTION="An emacs mode for handling Dockerfiles"
HOMEPAGE="https://github.com/spotify/dockerfile-mode"

EGIT_REPO_URI="https://github.com/spotify/dockerfile-mode.git"
EGIT_COMMIT="7223d92718f78fa3ab15667cdb2ed90cfeb579e7"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
DEPEND="
	app-emacs/s
	${RDEPEND}
"

DOCS="README.md"
