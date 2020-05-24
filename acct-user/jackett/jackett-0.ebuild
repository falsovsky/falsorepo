# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

ACCT_USER_ID=999
ACCT_USER_HOME=/var/lib/jackett
ACCT_USER_HOME_OWNER=jackett:jackett
ACCT_USER_HOME_PERMS=00755
ACCT_USER_GROUPS=( jackett )

acct-user_add_deps
