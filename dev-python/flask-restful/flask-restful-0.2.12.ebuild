# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="Flask-RESTful provides the building blocks for creating a great REST API"
HOMEPAGE="https://github.com/flask-restful/flask-restful"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="
"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/aniso8601-0.82
	>=dev-python/flask-0.8
	dev-python/pytz
	>=dev-python/six-1.3.0
"
