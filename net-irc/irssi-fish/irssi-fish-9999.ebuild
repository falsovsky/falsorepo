# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="FiSH encryption for irssi"
HOMEPAGE="https://github.com/falsovsky/FiSH-irssi/"
EGIT_REPO_URI="https://github.com/falsovsky/FiSH-irssi.git"
#EGIT_BRANCH="cbc"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/openssl
        dev-libs/glib
        net-irc/irssi"
RDEPEND="${DEPEND}"

src_prepare() {
        eapply_user
        sed -i -e 's#share/doc/FiSH-irssi#share/doc/'"$P"'#' CMakeLists.txt || die "Sed failed!"
        cmake-utils_src_prepare
}


