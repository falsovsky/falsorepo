# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit eutils user

MY_PN="${PN%-*}"		# strip off -bin
PROG_PN="${MY_PN%-*}"	# strip off -server

DESCRIPTION="Jellyfin is a Free Software Media System that puts you in control of managing and streaming your media."
HOMEPAGE="https://jellyfin.readthedocs.io/en/latest/"
KEYWORDS="-* ~arm ~amd64 ~x86"
SRC_URI="https://github.com/${PROG_PN}/${PROG_PN}/releases/download/v${PV}/${PROG_PN}_${PV}_linux-amd64.tar.gz"
SLOT="0"
LICENSE="GPL-2"
RESTRICT="mirror test"

RDEPEND="dev-libs/icu
	>=media-video/ffmpeg-4.0[encode,fdk,mp3,opus,theora,v4l,vorbis,vpx,webp,x264,xvid]"
DEPEND="${RDEPEND}"


PROG_DIR="/usr/lib/${MY_PN}"
DATA_DIR="/var/lib/${MY_PN}"
INIT_SCRIPT="${ROOT}/etc/init.d/${MY_PN}"

QA_PREBUILT="${PROG_DIR}/System.*.so ${PROG_DIR}/jellyfin ${PROG_DIR}/libSkiaSharp.so ${PROG_DIR}/libhostfxr.so ${PROG_DIR}/libhostpolicy.so"


pkg_setup() {
	einfo "creating user for ${MY_PN}"
	enewgroup ${PROG_PN}
	enewuser ${PROG_PN} -1 /bin/bash ${DATA_DIR} "${PROG_PN}"
}

src_unpack() {
	unpack ${A}
	mv ${PROG_PN}_${PV} ${P}
}

src_install() {
	diropts -o ${PROG_PN} -g ${PROG_PN}
	insopts -o ${PROG_PN} -g ${PROG_PN} -m 644

	dodir ${PROG_DIR}
	insinto ${PROG_DIR}
	doins -r ${S}/*
	chmod 755 ${D}${PROG_DIR}/${PROG_PN}

	keepdir ${DATA_DIR}

	newconfd "${FILESDIR}/${MY_PN}.conf" "${MY_PN}"
	newinitd "${FILESDIR}/${MY_PN}.init" "${MY_PN}"
}

pkg_postinst() {
	einfo ""
	einfo "${MY_PN} was installed to ${PROG_DIR}, to start please use the init script provided."
	einfo "All data generated and used by ${PROG_PN^} can be found at ${DATA_DIR} after the first start."
	einfo ""
}
