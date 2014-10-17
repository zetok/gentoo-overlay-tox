**Current build status:** [![Build Status](https://travis-ci.org/urras/gentoo-overlay-tox.svg)](https://travis-ci.org/urras/gentoo-overlay-tox)

To add this overlay from layman, run:

```sudo layman -a tox-overlay```

To add this overlay manually, run:

```
sudo su
layman -f -o https://raw.github.com/urras/gentoo-overlay-tox/master/repository.xml -a tox-overlay
```
If you are going to use net-im/tox-gui-qt or net-im/qtox, you need to add the [Qt overlay](http://wiki.gentoo.org/wiki/Qt/Qt5) using ```layman -a qt```. Please note that the Qt overlay is not our overlay, so please report issues with it at [their repository](https://github.com/gentoo/qt).

*See [Authors](AUTHORS) for the original authors of some of these ebuilds.*
