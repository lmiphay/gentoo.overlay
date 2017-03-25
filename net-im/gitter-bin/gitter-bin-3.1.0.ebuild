# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils unpacker

MY_PN="${PN/-bin/}"

DESCRIPTION="An IM/chat room system for developers & users of GitHub repos"
HOMEPAGE="https://gitter.im/"
SRC_URI="https://update.gitter.im/linux64/${MY_PN}_${PV}_amd64.deb"

# promised to be open sourced "no later than June 2017" with an MIT license
LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

QA_PREBUILT="opt/Gitter/linux64/Gitter"

S="${WORKDIR}/opt/Gitter/linux64"

src_prepare() {
	sed -i -e 's;/opt/Gitter/linux64/logo.png;gitter;' "${MY_PN}.desktop"

	eapply_user
}

src_install() {
	exeinto /opt/Gitter/linux64
	doexe Gitter

	insinto /opt/Gitter/linux64
	doins icudtl.dat libffmpegsumo.so nw.pak
	doins -r locales

	# exe named as per Gitter after-install.sh
	make_wrapper "${MY_PN}" ./Gitter /opt/Gitter/linux64 .

	newicon logo.png ${MY_PN}.png
	domenu gitter.desktop
}
