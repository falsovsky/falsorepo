My collection of ebuilds
---

You can use this overlay by adding a file to `/etc/portage/repos.conf/` containing the following:

```
[falso]
priority = 50
location = /var/db/repos/falso
sync-type = git
sync-uri = git://github.com/falsovsky/overlay.git 
auto-sync = Yes
```

