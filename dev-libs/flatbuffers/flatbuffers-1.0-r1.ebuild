# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3

DESCRIPTION="Memory Efficient Serialization Library"
HOMEPAGE="http://google.github.io/flatbuffers/"
EGIT_REPO_URI="https://github.com/google/flatbuffers.git"

LICENSE="Apache"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+doc +examples +java"

RDEPEND="java? ( virtual/jdk )"
DEPEND="dev-util/cmake
		${RDEPEND}"

src_compile() {
	cmake -G "Unix Makefiles"
	emake

	if use java ; then
	   (cd java && \
		javac com/google/flatbuffers/*.java && \
		jar cf flatbuffers.jar com/google/flatbuffers/*.class)
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
	   doins java/flatbuffers.jar
	fi
}
