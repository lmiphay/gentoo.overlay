# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="A Second Life viewer in Rust and Vulkan."
HOMEPAGE="https://aurora-viewer.org/"

SRC_URI="https://github.com/Aurora-Viewer/Aurora-Viewer/releases/download/v${PV}/Aurora-Viewer-v${PV}-linux-x64.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 -*"

INST_DIR="opt/aurora-bin"
QA_PREBUILT="${INST_DIR}/*"

RDEPEND="
	sys-libs/glibc
	media-libs/alsa-lib
"

S="${WORKDIR}/Aurora-Viewer-v${PV}-linux-x64"

src_install() {
	mkdir -p "${D}/${INST_DIR}/"
	cp -a . "${D}/${INST_DIR}/" || die
	dobin "${FILESDIR}/aurora"

	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/71${PN}

	make_desktop_entry /usr/bin/aurora "Aurora Viewer (bin)" /${INST_DIR}/aurora-viewer.svg
}
