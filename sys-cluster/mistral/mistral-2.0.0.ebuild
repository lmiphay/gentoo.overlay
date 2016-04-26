# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=(python{2_7,3_4})

inherit eutils distutils-r1

DESCRIPTION="Task orchestration service for OpenStack cloud"
HOMEPAGE="http://docs.openstack.org/developer/mistral"
SRC_URI="https://github.com/openstack/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# from requirements these should be (i.e. version bumps needed):
#   >=dev-python/python-barbicanclient-4.0.0
#   python-ceilometerclient>=2.2.1 # Apache-2.0
#   python-neutronclient>=4.2.0 # Apache-2.0
#   python-troveclient>=2.2.0 # Apache-2.0
#   python-ironicclient>=1.1.0 # Apache-2.0
RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/cliff-2.0.0
	>=dev-python/pbr-1.6.0
	>=dev-python/python-dateutil-2.4.2

	>=dev-python/alembic-0.8.4
	<dev-python/Babel-2.3.0
	>=dev-python/croniter-0.3.4
	>=dev-python/eventlet-0.18.4
	=dev-python/jsonschema-2.3.0
	=dev-python/keystonemiddleware-4.4.0
	>=dev-python/mock-1.2
	>=dev-python/networkx-1.10

	>=dev-python/oslo-concurrency-3.5.0
	>=dev-python/oslo-config-3.9.0
	>=dev-python/oslo-db-4.1.0
	>=dev-python/oslo-messaging-4.5.0
	>=dev-python/oslo-middleware-3.0.0
	>=dev-python/oslo-utils-3.5.0
	>=dev-python/oslo-log-1.14.0
	>=dev-python/oslo-serialization-1.10.0
	>=dev-python/oslo-service-1.0.0

	>=dev-python/paramiko-1.16.0
	>=dev-python/pbr-1.6
	>=dev-python/pecan-1.0.0

	>=dev-python/python-barbicanclient-3.3.0
	>=dev-python/python-ceilometerclient-1.1.1
	>=dev-python/python-cinderclient-1.6.0
	>=dev-python/python-glanceclient-2.0.0
	>=dev-python/python-heatclient-0.6.0
	>=dev-python/python-keystoneclient-1.6.0
	>=dev-python/python-neutronclient-4.1.1
	>=dev-python/python-novaclient-2.29.0
	>=dev-python/python-swiftclient-2.2.0
	>=dev-python/python-troveclient-1.3.0
	>=dev-python/python-ironicclient-0.9.0

	>=dev-python/pyyaml-3.1.0
	>=dev-python/requests-2.8.1
	>=dev-python/retrying-1.2.3
	>=dev-python/six-1.9.0
	>=dev-python/sqlalchemy-1.0.10
	>=dev-python/stevedore-1.9.0
	>=dev-python/WSME-0.8.0
	>=dev-python/tooz-1.28.0

	>=dev-python/python-ironic-inspector-client-1.6.0
	>=dev-python/python-mistralclient-2.0.0
	>=dev-python/python-zaqarclient-1.0.0
	>=dev-python/yaql-1.1.0
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	${RDEPEND}
"
