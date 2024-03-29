# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit systemd

DESCRIPTION="OpenGrok in a container"
HOMEPAGE="https://github.com/lmiphay/opengrok-docker"
SRC_URI="https://github.com/lmiphay/${PN}/archive/refs/tags/${PVR}.tar.gz -> ${PN}-${PVR}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	app-containers/docker
	net-misc/curl
	net-misc/wget
	sys-apps/coreutils
	sys-apps/grep
"
DEPEND="
"

DOCS="README.md"

S="${WORKDIR}/${PF}"

src_install() {
	dobin "bin/opengrok-docker"

	newconfd "openrc/opengrok.conf.d" "opengrok"
	newinitd "openrc/opengrok.init.d" "opengrok"

	systemd_dounit "etc/opengrok.service"

	insinto "/etc"
	doins "etc/opengrok.conf"
}
