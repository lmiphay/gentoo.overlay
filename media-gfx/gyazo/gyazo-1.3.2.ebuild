# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby27 ruby30"

inherit desktop ruby-single

DESCRIPTION="Seriously Instant Screen-Grabbing"
HOMEPAGE="https://gyazo.com"
if [[ ${PV} == 9999 ]];then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/gyazo/Gyazo-for-Linux.git"
else
	SRC_URI="https://github.com/gyazo/Gyazo-for-Linux/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~arm64 ~x86"
	S="${WORKDIR}/Gyazo-for-Linux-${PV}"
fi

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

DEPEND="media-gfx/imagemagick"
RDEPEND="${DEPEND}
	x11-misc/xclip
"
BDEPEND="${RUBY_DEPS}"

src_configure() {
	# Version is verion of the "Desktop Entry Specification" - not the application version
	#   see: https://specifications.freedesktop.org/desktop-entry-spec/latest/ar01s06.html
	sed -i 's/Version=1.3.1/Version=1.5/' "src/${PN}.desktop"
}

src_install(){
	newbin src/${PN}.rb ${PN}
	domenu src/${PN}.desktop
	doicon icons/${PN}.png
	dodoc README.md ${FILESDIR}/gyazo.config.yml
}

pkg_postinst(){
	elog "Usage: Just launch the Gyazo app, and then, drag your mouse to grab the screen."
	elog ""
	elog "The \$HOME/.gyazo.config.yml can be used to configure brower, clipboard command... etc"
}
