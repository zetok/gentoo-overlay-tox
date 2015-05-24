**Current build status:** [![Build Status](https://travis-ci.org/Tox/gentoo-overlay-tox.svg)](https://travis-ci.org/Tox/gentoo-overlay-tox)

To add this overlay from layman, run:

```sudo layman -a tox-overlay```

To add this overlay manually, run:

```
sudo su
layman -f -o https://raw.github.com/Tox/gentoo-overlay-tox/master/repository.xml -a tox-overlay
```

====

If client fails to build when updating, make sure that:
* your local copy of overlay is up-to-date: ``# layman -s tox-overlay``
* you have updated dependencies of client, e.g. for qTox: ``# emerge -1 net-libs/tox libfilteraudio``

If after those steps client still fails to build, please [report a bug](https://github.com/Tox/gentoo-overlay-tox/issues/new).


*See [Authors](AUTHORS) for the original authors of some of these ebuilds.*
