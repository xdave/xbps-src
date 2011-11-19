# Common variables.

# Current xbps-src version.
VERSION	= 3

PREFIX	?= /usr/local
#
# The following vars shouldn't be specified with DESTDIR!
#
SBINDIR	?= $(PREFIX)/sbin
SHAREDIR ?= $(PREFIX)/share/xbps-src
LIBEXECDIR ?= $(PREFIX)/libexec/xbps-src
ETCDIR	?= $(PREFIX)/etc/xbps
