# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

REVISION=6937
MY_P="SingularityAlpha-x86_64-${PV}.${REVISION}"

DESCRIPTION="An experimental Snowglobe 1.5 based Second Life Viewer"
HOMEPAGE="http://www.singularityviewer.org/"
SRC_URI="mirror://sourceforge/singularityview/alphas/${MY_P}.tar.bz2"
#http://sourceforge.net/projects/singularityview/files/alphas/SingularityAlpha-x86_64-1.8.7.6937.tar.bz2/download
RESTRICT="mirror"

LICENSE="GPL-2-with-Linden-Lab-FLOSS-exception"
SLOT="0"
KEYWORDS="~amd64 -*"
IUSE="fmod"

INST_DIR="opt/singularity-bin"
QA_PREBUILT="${INST_DIR}/*"

RDEPEND="
	sys-libs/glibc
	sys-apps/dbus
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXinerama
	dev-libs/libgcrypt
	dev-libs/libgpg-error
	dev-libs/openssl
	dev-libs/boost
	media-libs/freetype
	media-libs/libogg
	media-libs/libsdl
	media-libs/libvorbis
	media-libs/gstreamer
	media-plugins/gst-plugins-meta
	fmod? ( media-libs/fmod )
	net-libs/gnutls
	net-misc/curl
	net-dns/c-ares
	sys-libs/zlib
	virtual/glu
	virtual/opengl
"
DEPEND="${RDEPEND}
	app-admin/chrpath
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	chrpath -r '' lib64/libalut.so.0.0.0
	scanelf -Xr lib64/libalut.so.0.0.0
	eapply_user
}


src_install() {
	mkdir -p "${D}/${INST_DIR}/"
	cp -a . "${D}/${INST_DIR}/" || die
	dosym /${INST_DIR}/singularity /usr/bin/singularity
	make_desktop_entry singularity-bin "Singularity Viewer (bin)" /${INST_DIR}/viewer_icon.png
}
