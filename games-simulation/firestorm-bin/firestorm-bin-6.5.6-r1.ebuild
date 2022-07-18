# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils desktop font

REVISION=66221

DESCRIPTION="An open source metaverse viewer"
HOMEPAGE="http://www.firestormviewer.org/"

MY_P="Phoenix_Firestorm-Releasex64_x86_64_${PV}.${REVISION}"
SRC_URI="
	https://downloads.firestormviewer.org/preview/linux/${MY_P}.tar.xz
	http://3p.firestormviewer.org/freetype-2.4.4.180841832-linux64-180841832.tar.bz2
"
# https://downloads.firestormviewer.org/preview/linux/Phoenix_Firestorm-Releasex64_x86_64_6.5.3.65658.tar.xz

RESTRICT="mirror"

LICENSE="GPL-2-with-Linden-Lab-FLOSS-exception"
SLOT="0"
KEYWORDS="~amd64 -*"
IUSE="+system-sdl voice"

INST_DIR="opt/firestorm-bin"
QA_PREBUILT="${INST_DIR}/*"

RDEPEND="
	dev-libs/apr
	dev-libs/apr-util
	dev-libs/libgcrypt
	dev-libs/libgpg-error
	dev-libs/openssl
	dev-libs/boost
	media-fonts/kochi-substitute
	media-fonts/unifont
	media-libs/freetype
	media-libs/libogg
	media-libs/libvorbis
	media-libs/gstreamer
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
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXinerama
	system-sdl? ( media-libs/libsdl )
	voice? ( net-dns/libidn-compat )
"
DEPEND="${RDEPEND}
	app-admin/chrpath
"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	if use system-sdl ; then
		rm lib/libSDL-1.2.so.0* lib/libSDL.so || die
	fi

	# shouldn't need to null RPATH with chrpath - but scanelf
	# reports 'Security problem NULL DT_RPATH' otherwise
	chrpath -r '' lib/libffi.so.5.0.10
	scanelf -Xr lib/libffi.so.5.0.10
	chrpath -r '' lib/libalut.so.0.0.0
	scanelf -Xr lib/libalut.so.0.0.0
	chrpath -r '' bin/dullahan_host
	scanelf -Xr bin/dullahan_host

	eapply "${FILESDIR}/add-unifonts.patch"

	eapply_user
}

src_install() {
	mkdir -p "${D}/${INST_DIR}/"

	cp -a . "${D}/${INST_DIR}/" || die

	# https://github.com/lmiphay/gentoo.overlay/issues/15
	cp -a ${WORKDIR}/lib/release/libfreetype.so* "${D}/${INST_DIR}/lib/" || die

	dosym /${INST_DIR}/firestorm /usr/bin/firestorm-bin

	insinto /etc/revdep-rebuild
	doins "${FILESDIR}"/70${PN}

	make_desktop_entry firestorm-bin "Phoenix Firestorm Viewer (bin)" /${INST_DIR}/firestorm_icon.png

	# a hardwired fallback font in LLWindowSDL::getDynamicFallbackFontList
	mkdir -p "${D}/usr/share/fonts/truetype/kochi/"
	dosym /usr/share/fonts/kochi-substitute/kochi-gothic-subst.ttf \
		/usr/share/fonts/truetype/kochi/kochi-gothic.ttf
}
