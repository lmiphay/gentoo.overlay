# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils user linux-info git-r3

DESCRIPTION="libusb driver for the g13"
HOMEPAGE="https://github.com/ecraven/g13"
EGIT_REPO_URI="https://github.com/ecraven/g13.git"
EGIT_COMMIT="9a917c3c785161c788c47f09846b2fdd2550a9f8"

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
	sys-apps/coreutils
"
PATCHES=(
	"${FILESDIR}/add-modifiers.patch"
	"${FILESDIR}/add-logging.patch"
)

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
	eapply_user

	sed -i -e 's:/tmp/:/run/:' "g13.h"
	sed -i '/MODE/G' "91-g13.rules"

	# https://bugs.gentoo.org/823329
	sed -i -e 's:-lboost_system-mt:-lboost_system:' "Makefile"
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	dosbin g13d
	dobin pbm2lpbm
	dobin ${FILESDIR}/g13writelcd ${FILESDIR}/g13loadbind ${FILESDIR}/g13mod
	dodoc README.org *.bind ${FILESDIR}/keys.txt
	insinto /usr/share/${PN}
	doins *.lpbm ${FILESDIR}/99-uinput-g13.rules
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
