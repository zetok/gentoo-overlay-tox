Just run:
    
```
  sudo su
  layman -f -o https://raw.github.com/fr0stycl34r/gentoo-overlay-tox/master/repository.xml -a tox-overlay
  # If you are going to use net-im/tox-gui-qt-9999, you've to add the Qt overlay (NOT OUR OVERLAY; FILE BUGS FOR THIS AT THEIR TRACKER)
  layman -a qt
  layman -S
  emerge --sync
```

*Note: See [AUTHORS] (https://github.com/fr0stycl34r/gentoo-overlay-tox/blob/master/AUTHORS) for people who created these Ebuilds.*
