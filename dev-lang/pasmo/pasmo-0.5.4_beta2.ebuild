# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="0.5.4.beta2"
S="${WORKDIR}/${PN}-${MY_PV}"

DESCRIPTION="Pasmo is a Z80 cross assembler"
HOMEPAGE="http://pasmo.speccy.org/"
SRC_URI="http://pasmo.speccy.org/bin/${PN}-${MY_PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
