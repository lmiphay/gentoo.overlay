# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="8"

inherit systemd

DESCRIPTION="Save/restore system clock on machines without working RTC hardware"
HOMEPAGE="https://tracker.debian.org/pkg/${PN}"
SRC_URI="mirror://debian/pool/main/f/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"

S=${WORKDIR}/git

src_prepare() {
	sed -i -e "s:/etc/${PN}.data:/var/lib/${PN}/data:" "${PN}" "${PN}.8"
	sed -i -e "s:/etc/default/fake-hwclock:/etc/conf.d/fake-hwclock:" "${PN}.8"

	eapply_user
}

src_install() {
	keepdir "/var/lib/${PN}"

	into /
	dosbin "${PN}"
	doman "${PN}.8"
	dodoc debian/changelog

	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
	doconfd "etc/default/${PN}"
	insinto /etc/cron.hourly
	newins "debian/${PN}.cron.hourly" "${PN}.cron"

	systemd_dounit "debian/${PN}-load.service"
	systemd_dounit "debian/${PN}-save.service"
	systemd_dounit "debian/${PN}-save.timer"
}

pkg_postinst() {
	elog "To enable and start the systemd services:"
	elog ""
	elog "systemctl enable --now ${PN}-load.service ${PN}-save.service ${PN}-save.timer"
}
