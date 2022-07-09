# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{9..10} )
inherit distutils-r1

DESCRIPTION="Framework for fast, easy, and documented API development with Flask"
HOMEPAGE="https://github.com/python-restx/flask-restx"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dev doc test"
RESTRICT="
	!test? ( test )
"

DEPEND=""
RDEPEND="${DEPEND}
	>=dev-python/aniso8601-0.82
	dev-python/jsonschema
	>=dev-python/flask-0.8
	dev-python/pytz
	>=dev-python/six-1.3.0
	dev-python/werkzeug
	dev? (
		dev-python/black
		dev-python/tox
	)
	doc? (
		=dev-python/alabaster-0.7.12
		=dev-python/sphinx-2.1.2
		=dev-python/sphinx-issues-1.2.0
	)
	test? (
		dev-python/blinker
		=dev-python/faker-2.0.0
		=dev-python/mock-3.0.5
		dev-python/ossaudit
		=dev-python/pytest-5.0.1
		=dev-python/pytest-benchmark-3.2.2
		=dev-python/pytest-cov-2.7.1
		=dev-python/pytest-flask-0.15.1
		=dev-python/pytest-mock-1.10.4
		=dev-python/pytest-profiling-1.7.0
		=dev-python/pytest-sugar-0.9.2
		=dev-python/readme-renderer-24.0
		dev-python/tzlocal
	)
"
