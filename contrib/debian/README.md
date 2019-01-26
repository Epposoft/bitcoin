
Debian
====================
This directory contains files used to package EPPOd/EPPO-qt
for Debian-based Linux systems. If you compile EPPOd/EPPO-qt yourself, there are some useful files here.

## EPPO: URI support ##


EPPO-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install EPPO-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your EPPO-qt binary to `/usr/bin`
and the `../../share/pixmaps/EPPO128.png` to `/usr/share/pixmaps`

EPPO-qt.protocol (KDE)

