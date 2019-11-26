# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

ACCT_USER_ID=983
ACCT_USER_HOME=/var/lib/jellyfin-server
ACCT_USER_HOME_OWNER=jellyfin:jellyfin
ACCT_USER_HOME_PERMS=00755
ACCT_USER_GROUPS=( jellyfin )

acct-user_add_deps
