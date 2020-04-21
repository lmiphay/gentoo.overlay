# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit ecm git-r3

DESCRIPTION="Plasma 5 panel with a plank/mac style zoom effect"
HOMEPAGE="https://github.com/psifidotos/nowdock-panel"
EGIT_REPO_URI="https://github.com/psifidotos/nowdock-panel.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	kde-plasma/plasma-workspace
"
DEPEND="${RDEPEND}
"

DOCS="README.md"

BUILD_DIR=${WORKDIR}/${P}/build
