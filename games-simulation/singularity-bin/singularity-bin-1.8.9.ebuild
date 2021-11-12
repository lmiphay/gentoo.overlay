# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils versionator

REVISION=8338
MY_PV=$(get_version_component_range 1-3 $(replace_all_version_separators '_'))

DESCRIPTION="An experimental Snowglobe 1.5 based Second Life Viewer"
HOMEPAGE="http://www.singularityviewer.org/"
SRC_URI="https://github.com/singularity-viewer/SingularityViewer/releases/download/sv-${PV}.${REVISION}-release/Singularity_${MY_PV}_${REVISION}_x86_64.tar.xz"
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
	virtual/libcrypt
	virtual/opengl
"
DEPEND="${RDEPEND}
	app-admin/chrpath
"

S="${WORKDIR}/Singularity_${MY_PV}_${REVISION}_x86_64"

src_prepare() {
	chrpath -r '' lib64/libalut.so.0.0.0
	scanelf -Xr lib64/libalut.so.0.0.0
	rm -f bin/SLVoice bin/llplugin/libmedia_plugin_gstreamer.so lib32/*
	eapply_user
}

src_install() {
	mkdir -p "${D}/${INST_DIR}/"
	cp -a . "${D}/${INST_DIR}/" || die
	chmod 0755 "${D}/${INST_DIR}/"
	dosym /${INST_DIR}/singularity /usr/bin/singularity
	make_desktop_entry singularity-bin "Singularity Viewer (bin)" /${INST_DIR}/viewer_icon.png
}
