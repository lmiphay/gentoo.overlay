# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DISTUTILS_OPTIONAL=1
PYTHON_COMPAT=(python{2_7,3_{3,4}})
inherit eutils distutils-r1 git-r3

DESCRIPTION="Memory Efficient Serialization Library"
HOMEPAGE="http://google.github.io/flatbuffers/"
EGIT_REPO_URI="https://github.com/google/flatbuffers.git"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+doc +examples +java +python"

RDEPEND="
	java? ( virtual/jdk )
	python? ( ${PYTHON_DEPS} )
"
DEPEND="
	dev-util/cmake
	java? ( dev-java/maven-bin )
	python? ( dev-python/setuptools[${PYTHON_USEDEP}] )
	${RDEPEND}
"

# fixme
# repo=$T/mvnrepository
repo=/var/cache/maven

pkg_pretend()
{
	if use java ; then
		[ -d $repo ] || die "please 'mkdir -p $repo' owner portage:portage and try again"
		owner=$(stat -c %U:%G $repo)
		[ "$owner" = "portage:portage" ] || die "please 'chown portage:portage $repo' and try again"
	fi
}

src_compile() {
	cmake -G "Unix Makefiles"
	emake

	if use java ; then
		addwrite $repo
		cd java && mvn -Dmaven.repo.local=$repo package
	fi
}

src_install() {
	dobin ${WORKDIR}/flatbuffers-${PV}/flatc

	insinto /usr/include
	doins -r include/flatbuffers

	if use doc ; then
		dohtml -r docs
	fi

	if use examples ; then
		dodoc -r samples
	fi

	if use java ; then
		insinto /usr/share/${PN}
		doins java/target/flatbuffers*.jar
	fi

	if use python ; then
		cd python && distutils-r1_src_install
	fi
}
