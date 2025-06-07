# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )
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
