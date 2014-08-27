To add this overlay from layman, run:

```sudo layman -a tox-overlay```

To add this overlay manually, run:

```
  sudo su
  layman -f -o https://raw.github.com/urras/gentoo-overlay-tox/master/repository.xml -a tox-overlay
  # If you are going to use net-im/tox-gui-qt or net-im/toxgui, you need to add the Qt overlay (NOT OUR OVERLAY; FILE BUGS FOR THIS AT THEIR TRACKER)
  layman -a qt
  layman -S
  emerge --sync
```

*Note: See [AUTHORS] (https://github.com/urras/gentoo-overlay-tox/blob/master/AUTHORS) for the people who created many of  these Ebuilds.*
