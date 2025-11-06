# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop font

DESCRIPTION="An open source metaverse viewer"
HOMEPAGE="http://www.secondlife.com/"

MY_PV=$(ver_cut 1-4)
MY_PV=${MY_PV//\./_}
MY_P="Second_Life_Test_${MY_PV}_x86_64"
SRC_URI="
	https://github.com/secondlife/viewer/releases/download/Second_Life_Test%23fc9805fd-develop-linux/${MY_P}.tar.xz
"
# https://github.com/secondlife/viewer/releases/download/Second_Life_Test%23fc9805fd-develop-linux/Second_Life_Test_7_2_3_19118087368_x86_64.tar.xz

RESTRICT="mirror"

LICENSE="GPL-2-with-Linden-Lab-FLOSS-exception"
SLOT="0"
KEYWORDS="~amd64 -*"

INST_DIR="opt/secondlife-bin"
QA_PREBUILT="${INST_DIR}/*"

RDEPEND="
	app-crypt/libmd
	dev-libs/libbsd
	dev-libs/libgcrypt
	dev-libs/libgpg-error
	dev-libs/openssl
	dev-libs/boost
	media-fonts/kochi-substitute
	media-fonts/unifont
	media-libs/freetype
	media-libs/gstreamer
	media-libs/libogg
	media-libs/libvorbis
	media-libs/opus
	media-plugins/gst-plugins-meta
	net-libs/gnutls
	net-misc/curl
	net-dns/c-ares
	sys-apps/dbus
	sys-libs/glibc
	sys-libs/zlib
	virtual/glu
	virtual/libcrypt
	virtual/opengl
	x11-libs/libxcb
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXinerama
"
DEPEND="${RDEPEND}
	app-admin/chrpath
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# shouldn't need to null RPATH with chrpath - but scanelf
	# reports 'Security problem NULL DT_RPATH' otherwise
	chrpath -r '' lib/libffi.so.5.0.10
	scanelf -Xr lib/libffi.so.5.0.10
	chrpath -r '' lib/libalut.so.0.0.0
	scanelf -Xr lib/libalut.so.0.0.0
	chrpath -r '' bin/dullahan_host
	scanelf -Xr bin/dullahan_host

	eapply_user
}

src_install() {
	mkdir -p "${D}/${INST_DIR}/"

	cp -a . "${D}/${INST_DIR}/" || die

	dosym /${INST_DIR}/secondlife /usr/bin/secondlife-bin

	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/70${PN}

	make_desktop_entry secondlife-bin "Secondlife Viewer (bin)" /${INST_DIR}/secondlife_icon.png

	# a hardwired fallback font in LLWindowSDL::getDynamicFallbackFontList
	#mkdir -p "${D}/usr/share/fonts/truetype/kochi/"
	#dosym /usr/share/fonts/kochi-substitute/kochi-gothic-subst.ttf \
	#	/usr/share/fonts/truetype/kochi/kochi-gothic.ttf
}
