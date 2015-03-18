# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit elisp

DESCRIPTION="A Brief emulator for Emacs"
HOMEPAGE="http://xpt.sourceforge.net/tools/brief-mode/"
#SRC_URI="http://sourceforge.net/projects/xpt/files/brief-mode/brief-mode-1.1/brief-mode-1.1.tgz/download"
SRC_URI="mirror://sourceforge/xpt/${P}.tgz"
RESTRICT="mirror"

LICENSE="brief-mode"
SLOT="0"
KEYWORDS="amd64 x86"

DOCS="brief-mode.htm brief-mode.news"

src_prepare() {
	sed -i -e 's:global-set-key \[DEL]:global-set-key [delete]:' "brief-mode.el"
	sed -i -e 's:global-set-key \[M-DEL]:global-set-key [M-delete]:' "brief-mode.el"
}
