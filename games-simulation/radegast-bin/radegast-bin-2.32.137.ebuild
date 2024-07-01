# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2-utils xdg desktop

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
"

S=${WORKDIR}/net471

src_prepare() {
	rm license.txt

	# fails: DllImport error loading library, but then dies with:
	#  System.BadImageFormatException: Invalid Image
	ln -s openjpeg-dotnet.dll libopenjpeg-dotnet.dll
	ln -s openjpeg-dotnet-x86_64.dll libopenjpeg-dotnet-x86_64.dll

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
