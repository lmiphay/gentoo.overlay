# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

# check: https://sourceforge.net/projects/kokua.team-purple.p/files/Kokua-SL/Linux64Bit/
REVISION=60579

DESCRIPTION="An open source metaverse viewer"
HOMEPAGE="http://blog.kokuaviewer.org/"

# https://bitbucket.org/kokua/downloads/downloads/Kokua_RLV_7_1_10_59780_x86_64.tar.xz
MY_PV=$(ver_rs 1-2 '_')
MY_P="Kokua_RLV_${MY_PV}_${REVISION}_x86_64"
MY_PFT="Kokua_FTRLV_${MY_PV}_${REVISION}_x86_64"
SRC_URI="
	ftrlv? ( https://bitbucket.org/kokua/downloads/downloads/${MY_PFT}.tar.xz )
	!ftrlv? ( https://bitbucket.org/kokua/downloads/downloads/${MY_P}.tar.xz )"
RESTRICT="mirror"

LICENSE="GPL-2-with-Linden-Lab-FLOSS-exception"
SLOT="0"
KEYWORDS="~amd64 -*"
IUSE="ftrlv"

INST_DIR="opt/kokua-bin"
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
	media-libs/libpng
	media-libs/libsdl
	media-libs/libvorbis
	media-libs/gstreamer
	media-plugins/gst-plugins-meta
	net-libs/gnutls
	net-misc/curl
	net-dns/c-ares
	sys-libs/zlib
	virtual/glu
	virtual/libcrypt
	virtual/opengl
"
DEPEND="${RDEPEND}
	app-admin/chrpath
"

src_unpack() {
	default
	if use ftrlv ; then
		mv ${WORKDIR}/${MY_PFT} ${WORKDIR}/${P} || die
	else
		mv ${WORKDIR}/${MY_P} ${WORKDIR}/${P} || die
	fi
}

src_prepare() {
	# rm lib/libpng12.so* lib/libSDL-1.2.so.0* || die
	# shouldn't need to null RPATH with chrpath - but scanelf
	# reports 'Security problem NULL DT_RPATH' otherwise
	chrpath -r '' lib/lib32/libalut.so.0.0.0
	scanelf -Xr lib/lib32/libalut.so.0.0.0
	chrpath -r '' bin/dullahan_host
	scanelf -Xr bin/dullahan_host
	eapply_user
}

src_install() {
	mkdir -p "${D}/${INST_DIR}/"
	cp -a . "${D}/${INST_DIR}/" || die
	dobin "${FILESDIR}/kokua"

	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/71${PN}

	make_desktop_entry /usr/bin/kokua "Kokua Viewer (bin)" /${INST_DIR}/kokua_icon.png
}
