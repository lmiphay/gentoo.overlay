# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit gnome2-utils eutils xdg desktop

MY_PN="${PN/-bin/}"

DESCRIPTION="A messaging app for teams"
HOMEPAGE="https://radegast.life"
SRC_URI="https://bitbucket.org/cinderblocks/radegast/downloads/Radegast-${PV}.tbz -> ${MY_PN}-${PV}.tar.bz2"
LICENSE="BSD"
RESTRICT="mirror"

SLOT="0"
KEYWORDS="~amd64 -*"
IUSE=""

QA_PREBUILT="opt/${PN}/*"

DEPEND=""
RDEPEND="
	dev-dotnet/libgdiplus[cairo]
	dev-lang/mono
	media-libs/fmod
"

S=${WORKDIR}/bin

src_prepare() {
	rm license.txt

	# Login error:
	# Failed to initialize the sound system: System.DllNotFoundException: fmod
	#  at (wrapper managed-to-native) FMOD.Factory:FMOD_System_Create (intptr&) ...
	rm libfmod.so libfmod.so.8 libfmodstudio.so libfmodstudio.so.8
	ln -s libfmod.so.8.14 libfmod.so.8
	ln -s libfmod.so.8.14 libfmod.so
	ln -s libfmodstudio.so.8.14 libfmodstudio.so.8
	ln -s libfmodstudio.so.8.14 libfmodstudio.so

	eapply_user
}

src_install() {
	doicon ${MY_PN}.png

	mkdir -p "${D}/opt/${PN}/"
	cp -pr . ${D}/opt/${PN}

	make_wrapper "${PN}" "mono ./Radegast.exe" "/opt/${PN}" "/opt/${PN}:/opt/fmodex/api/lib"
	make_desktop_entry "${PN}" "Radegast" "/usr/share/pixmaps/${MY_PN}.png"
}

pkg_preinst() {
	xdg_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}
