# Common variables.

# Current xbps-src version.
VERSION	= 2

PREFIX	?= /usr/local
SBINDIR	?= $(DESTDIR)$(PREFIX)/sbin
#
# The following vars shouldn't be specified with DESTDIR!
#
SHAREDIR ?= $(PREFIX)/share/xbps-src
LIBEXECDIR ?= $(PREFIX)/libexec/xbps-src
ETCDIR	?= $(PREFIX)/etc/xbps
