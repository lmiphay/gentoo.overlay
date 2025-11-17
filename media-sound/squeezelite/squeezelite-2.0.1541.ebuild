# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit flag-o-matic git-r3 systemd

DESCRIPTION="Lightweight headless squeezebox client emulator"
HOMEPAGE="https://github.com/ralph-irving/squeezelite"

EGIT_REPO_URI="https://github.com/ralph-irving/squeezelite.git"
EGIT_COMMIT="72e1fd8abfa9b2f8e9636f033247526920878718"
# see VERSION #def in squeezelite.h

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="aac dsd ffmpeg flac mad mpg123 pulseaudio resample visexport vorbis"

# ffmpeg provides alac and wma codecs
DEPEND="media-libs/alsa-lib
		flac? ( media-libs/flac )
		ffmpeg? ( media-video/ffmpeg )
		vorbis? ( media-libs/libvorbis )
		mad? ( media-libs/libmad )
		mpg123? ( media-sound/mpg123 )
		aac? ( media-libs/faad2 )
		resample? ( media-libs/soxr )
		visexport? ( media-sound/jivelite )
		pulseaudio? ( media-plugins/alsa-plugins[pulseaudio] )
"
RDEPEND="${DEPEND}
		 media-sound/alsa-utils"

# OPT_ALAC       = -DALAC
# OPT_IR         = -DIR
# OPT_GPIO       = -DGPIO
# OPT_RPI        = -DRPI
# OPT_OPUS       = -DOPUS
# OPT_SSL        = -DUSE_SSL
# OPT_NOSSLSYM   = -DNO_SSLSYM
# OPT_PORTAUDIO  = -DPORTAUDIO
# OPT_PULSEAUDIO = -DPULSEAUDIO

src_compile() {
	export OPTS=""

	if use dsd; then
		OPTS+=" -DDSD"
		einfo "dsd support enabled via dsd2pcm"
	fi

	if use ffmpeg; then
		OPTS+=" -DFFMPEG"
		einfo "alac and wma support enabled via ffmpeg"
	fi

	if use resample; then
		OPTS+=" -DRESAMPLE"
		einfo "resample support enabled via soxr"
	fi

	if use visexport; then
		OPTS+=" -DVISEXPORT"
		einfo "audio data export to jivelite support enabled"
	fi

	if ! use mad; then
		OPTS+=" -DSL_NO_MAD"
	fi
	if ! use mpg123; then
		OPTS+=" -DSL_NO_MPG123"
	fi
	if ! use mad && ! use mpg123; then
		einfo "MP3 support disabled; add 'mad' (recommended)"
		einfo "  or 'mpg123' USE flag if you need it"
	fi
	if ! use aac; then
		OPTS+=" -DNO_FAAD"
		einfo "AAC support disabled; add 'aac' USE flag if you need it"
	fi

	# Build it
	emake || die "emake failed"
}

src_install() {
	dobin squeezelite
	dobin ${FILESDIR}/pasqueezelite
	dodoc LICENSE.txt
	doman "doc/${PN}.1"

	newconfd "${FILESDIR}/${PN}.conf.d" "${PN}"
	newinitd "${FILESDIR}/${PN}.init.d" "${PN}"

	systemd_dounit "${FILESDIR}"/${PN}.service
}

pkg_postinst() {
	elog "If you want start Squeezelite automatically on system boot:"
	elog "  rc-update add squeezelite default"
	elog "Edit /etc/cond.d/squeezelite to customise -- in particular"
	elog "you may want to set the audio device to be used."
}
