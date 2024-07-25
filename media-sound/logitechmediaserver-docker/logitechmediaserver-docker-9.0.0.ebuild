# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit systemd

DESCRIPTION="Logitechmediaserver in a container"
HOMEPAGE="https://github.com/lmiphay/logitechmediaserver-docker"
SRC_URI="https://github.com/lmiphay/${PN}/archive/refs/tags/${PVR}.tar.gz -> ${PN}-${PVR}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
	app-containers/docker
	sys-apps/coreutils
	!media-sound/logitechmediaserver-bin
	sys-apps/grep
"
DEPEND="
"

DOCS="README.md"

S="${WORKDIR}/${PF}"

src_install() {
	dobin "bin/logitechmediaserver-docker"

	newconfd "openrc/logitechmediaserver.conf.d" "logitechmediaserver"
	newinitd "openrc/logitechmediaserver.init.d" "logitechmediaserver"

	systemd_dounit "etc/logitechmediaserver.service"

	insinto "/etc"
	doins "etc/logitechmediaserver.conf"
}
