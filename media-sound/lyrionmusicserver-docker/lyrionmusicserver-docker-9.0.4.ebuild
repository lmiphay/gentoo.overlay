# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit systemd

DESCRIPTION="Lyrionmusicserver in a container"
MY_PN="logitechmediaserver-docker"
HOMEPAGE="https://github.com/lmiphay/${MY_PN}"
SRC_URI="https://github.com/lmiphay/${MY_PN}/archive/refs/tags/${PVR}.tar.gz -> ${MY_PN}-${PVR}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
	app-containers/docker
	app-containers/docker-cli
	sys-apps/coreutils
	sys-apps/grep
"
DEPEND="
"

DOCS="README.md"

#S="${WORKDIR}/${PF}"
S="${WORKDIR}/${MY_PN}-${PVR}"

src_install() {
	dobin "bin/lyrionmusicserver-docker"

	newconfd "openrc/lyrionmusicserver.conf.d" "lyrionmusicserver"
	newinitd "openrc/lyrionmusicserver.init.d" "lyrionmusicserver"

	systemd_dounit "etc/lyrionmusicserver.service"

	insinto "/etc"
	doins "etc/lyrionmusicserver.conf"
}
