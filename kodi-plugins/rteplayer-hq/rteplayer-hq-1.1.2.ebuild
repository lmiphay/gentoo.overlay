# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils git-r3

DESCRIPTION="RTE Player HQ"
HOMEPAGE="http://zakalibit.github.io/kodi.rteplayer.hq/"

MY_PN="rteplayer.hq"
PLUGIN="plugin.video.${MY_PN}"

EGIT_REPO_URI="https://github.com/zakalibit/kodi.rteplayer.hq.git"
EGIT_COMMIT="0b8eadc06c28beabc5a5da4fa5612038a42e67cb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	app-arch/unzip
"
RDEPEND="
	>=media-tv/kodi-15.0
"

INSTALL_DIR="/usr/share/kodi/addons/${PLUGIN}"

src_unpack() {
	git-r3_src_unpack
	cd "${WORKDIR}"
	unpack "./${P}/${PLUGIN}/${PLUGIN}-${PV}.zip"
}

src_install() {
	dodoc README.md
	insinto ${INSTALL_DIR}
	doins ${WORKDIR}/${PLUGIN}/*
}
