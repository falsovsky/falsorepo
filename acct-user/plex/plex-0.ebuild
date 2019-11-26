# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

ACCT_USER_ID=996
ACCT_USER_HOME=/var/lib/plexmediaserver
ACCT_USER_HOME_OWNER=plex:plex
ACCT_USER_HOME_PERMS=00755
ACCT_USER_GROUPS=( plex video )

acct-user_add_deps
