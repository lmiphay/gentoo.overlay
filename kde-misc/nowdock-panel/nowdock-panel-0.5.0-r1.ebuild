# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit kde5

DESCRIPTION="Plasma 5 panel with a plank/mac style zoom effect"
HOMEPAGE="https://github.com/psifidotos/nowdock-panel"
SRC_URI="https://github.com/psifidotos/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
# https://dl.opendesktop.org/api/files/download/id/1473029935/plasma-transparent-panel.py.v0.2.2.tar.gz

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(add_plasma_dep plasma-workspace)
"
DEPEND="${RDEPEND}
"

DOCS="README.md"

BUILD_DIR=${WORKDIR}/${P}/build
