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

S="${WORKDIR}"

src_prepare() {
	rm opt/Gitter/linux64/after-install.sh opt/Gitter/linux64/after-remove.sh
	eapply_user
}

src_install() {
	dodoc usr/share/doc/gitter/changelog.Debian.gz

	insinto /opt
	doins -r opt/Gitter
	fperms +x /opt/Gitter/linux64/Gitter

	# executable named as per the Gitter after-install.sh script
	dosym  /opt/Gitter/linux64/Gitter /usr/bin/${MY_PN}

	# weird, but won't start without this
	dosym  /opt/Gitter/linux64/icudtl.dat /usr/bin/icudtl.dat

	domenu opt/Gitter/linux64/gitter.desktop
}
