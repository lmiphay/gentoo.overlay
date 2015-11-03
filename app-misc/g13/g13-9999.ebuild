# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils user linux-info git-r3

DESCRIPTION="libusb driver for the g13"
HOMEPAGE="https://github.com/ecraven/g13"
EGIT_REPO_URI="https://github.com/ecraven/g13.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/boost
	dev-libs/libusb
"
RDEPEND="${DEPEND}
	media-gfx/imagemagick
"

pkg_pretend() {
	CONFIG_CHECK="~INPUT_UINPUT"
	check_extra_config
}

pkg_setup() {
	# use plugdev for now
	# see: https://blogs.gentoo.org/mgorny/2013/07/03/local-device-access-from-plugdev-to-logind/
	enewgroup plugdev
	enewuser g13 -1 -1 "/dev/null" "plugdev,usb"
}

src_prepare () {
	sed -i -e 's:/tmp/:/run/:' "g13.h"
	sed -i -e 's:g++:$(CXX) $(CXXFLAGS) $(LDFLAGS):' "Makefile"
	epatch_user
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dosbin g13d
	dobin pbm2lpbm ${FILESDIR}/g13writelcd
	dodoc README.org *.bind ${FILESDIR}/keys.txt
	insinto /usr/share/${PN}
	doins *.lpbm ${FILESDIR}/92-uinput-g13.rules
	insinto /lib/udev/rules.d
	doins 91-g13.rules

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"
}

pkg_postinst() {
	elog "Note that the command pipe is: /run/g13-0"
	elog "And you need to be in the plugdev group to write to it."
	elog ""
	elog "If you have configured UINPUT support as a modules you"
	elog "may wish to add uinput to /etc/modules"
	elog ""
	elog "You probably want to copy:"
	elog "   /usr/share/${PN}/92-uinput-g13.rules to /etc/udev/rules.d"
	elog ""
	elog "If you want to start g13d automatically on system boot:"
	elog "  rc-update add g13 default"
	elog ""
	elog "The daemon output is being logged to /var/log/${PN}.log"
	elog ""
	elog "Bindings similar to the windows default are available at:"
	elog "  https://github.com/zekesonxx/g13-profiles"
}
