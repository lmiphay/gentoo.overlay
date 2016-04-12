# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit eutils git-r3

DESCRIPTION="RTE Player HQ"
HOMEPAGE="http://zakalibit.github.io/kodi.rteplayer.hq/"

MY_PN="rteplayer.hq"
MY_PV=${PV/_/-}
PLUGIN="plugin.video.${MY_PN}"

EGIT_REPO_URI="https://github.com/zakalibit/kodi.rteplayer.hq.git"
EGIT_COMMIT="10439b37a938f3769c7eb01fbfa7be3d93c17dad"

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
	unpack "./${P}/${PLUGIN}/${PLUGIN}-${MY_PV}.zip"
}

src_install() {
	dodoc README.md ${FILESDIR}/advancedsettings.xml
	insinto ${INSTALL_DIR}
	doins -r ${WORKDIR}/${PLUGIN}/*
}

pkg_postinst() {
	elog "if you see buffering issues then see: "
	elog "   http://kodi.wiki/view/HOW-TO:Modify_the_video_cache"
	elog ""
	elog "An example advancedsettings.xml is in: /usr/share/doc/${P}/"
}
