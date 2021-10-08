# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit eutils systemd

DESCRIPTION="AdGuard Home in a container"
HOMEPAGE="https://github.com/lmiphay/adguardhome-docker"
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
	dobin "bin/adguardhome-docker"

	newconfd "openrc/adguardhome.conf.d" "adguardhome"
	newinitd "openrc/adguardhome.init.d" "adguardhome"

	systemd_dounit "etc/adguardhome.service"

	insinto "/etc"
	doins "etc/adguardhome.conf"
}
