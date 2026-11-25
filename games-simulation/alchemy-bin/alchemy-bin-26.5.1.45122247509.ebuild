# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="An openmetaverse compatible viewer"
HOMEPAGE="https://www.alchemyviewer.org/"

PROJECT="Alchemy_Project%23666ef7bf-Quantum"
MY_PV="${PV//\./_}"

SRC_URI="https://github.com/AlchemyViewer/Alchemy/releases/download/$PROJECT/Alchemy_Project_Quantum_${MY_PV}_x86_64.tar.xz"
# https://github.com/AlchemyViewer/Alchemy/releases/download/Alchemy_Project%23666ef7bf-Quantum/Alchemy_Project_Quantum_26_5_1_45122247509_x86_64.tar.xz

RESTRICT="mirror"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 -*"

INST_DIR="opt/alchemy-bin"
QA_PREBUILT="${INST_DIR}/*"

RDEPEND="
	sys-libs/glibc
	media-libs/alsa-lib
"

S="${WORKDIR}/Alchemy_Project_Quantum_${MY_PV}_x86_64"

src_install() {
	mkdir -p "${D}/${INST_DIR}/"
	cp -a . "${D}/${INST_DIR}/" || die
	dobin "${FILESDIR}/alchemy"

	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/71${PN}

	make_desktop_entry /usr/bin/alchecmy "Alchemy Viewer (bin)" /${INST_DIR}/app_settings/alchemy_logo.png
}
