# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit eutils systemd

DESCRIPTION="Homeassistant in a container"
HOMEPAGE="https://github.com/lmiphay/homeassistant-docker"
SRC_URI="https://github.com/lmiphay/${PN}/archive/refs/tags/${PVR}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	app-emulation/docker
	sys-apps/coreutils
	sys-apps/grep
"
DEPEND="
"

DOCS="README.md"

S="${WORKDIR}/${PF}"

src_install() {
	dobin "bin/homeassistant-docker"

	newconfd "openrc/homeassistant.conf.d" "homeassistant"
	newinitd "openrc/homeassistant.init.d" "homeassistant"

	systemd_dounit "etc/homeassistant.service"

	insinto "/etc"
	doins "etc/homeassistant.conf"
}
