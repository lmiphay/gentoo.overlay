# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit readme.gentoo-r1

DESCRIPTION="A different take on the thermostat card for Home Assistant Lovelace UI"
HOMEPAGE="https://github.com/nervetattoo/simple-thermostat"
SRC_URI="https://github.com/nervetattoo/simple-thermostat/releases/download/${PV}/${PN}.js -> ${P}.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="app-misc/homeassistant-bin"
DEPEND=""
BDEPEND=""

S="${WORKDIR}"

DISABLE_AUTOFORMATTING=1
FORCE_PRINT_ELOG=1
DOC_CONTENTS="
	To configure Lovelace to load the simple-thermostat card, first read:

	https://github.com/nervetattoo/simple-thermostat#installation-manual

	Then, to add the resource item via the Lovelace UI:

	(three dots - top RHS) -> 'Configure UI' (top RHS) -> (three dots - top RHS) -> 'Raw config editor'

	(and add the three lines described in the simple-thermostat manual installation)

	As an example, it may look like this (if there are no other custom cards configured):

title: Myplace
resources:
  - url: /local/simple-thermostat.js?v=1
	type: module
views:
  - ...

	Above from, and thanks to the contributors at:

	https://www.reddit.com/r/homeassistant/comments/alcuv1/lovelace_custom_cards_without_uilovelaceyaml/
"

src_unpack() {
	true
}

src_install() {
	insinto /etc/homeassistant/www
	newins "${DISTDIR}/${P}.js" "${PN}.js"

	readme.gentoo_create_doc
	default
}

pkg_postinst() {
	readme.gentoo_print_elog
}
