include vars.mk

BINS	= xbps-src
SUBDIRS	= etc libexec helpers shutils

.PHONY: all
all:
	for bin in $(BINS); do						\
		sed -e	"s|@@XBPS_INSTALL_PREFIX@@|$(PREFIX)|g"		\
		    -e	"s|@@XBPS_INSTALL_ETCDIR@@|$(ETCDIR)|g"		\
		    -e  "s|@@XBPS_INSTALL_SHAREDIR@@|$(SHAREDIR)|g"	\
		    -e  "s|@@XBPS_INSTALL_SBINDIR@@|$(SBINDIR)|g"	\
		    -e	"s|@@XBPS_INSTALL_LIBEXECDIR@@|$(LIBEXECDIR)|g"	\
		    -e  "s|@@XBPS_SRC_VERSION@@|$(VERSION)|g"		\
			$$bin.sh.in > $$bin;				\
	done
	for dir in $(SUBDIRS); do			\
		$(MAKE) -C $$dir || exit 1;		\
	done

.PHONY: clean
clean:
	-rm -f $(BINS)
	for dir in $(SUBDIRS); do			\
		$(MAKE) -C $$dir clean || exit 1;	\
	done

.PHONY: install
install: all
	install -d $(DESTDIR)$(SBINDIR)
	for bin in $(BINS); do					\
		install -m 755 $$bin $(DESTDIR)$(SBINDIR);	\
	done
	for dir in $(SUBDIRS); do				\
		$(MAKE) -C $$dir install || exit 1;		\
	done

.PHONY: uninstall
uninstall:
	for bin in $(DESTDIR)$(BINS); do			\
		rm -f $(DESTDIR)$(SBINDIR)/$$bin;		\
	done
	for dir in $(SUBDIRS); do				\
		$(MAKE) -C $$dir uninstall || exit 1;		\
	done

dist:
	@echo "Building distribution tarball for tag: v$(VERSION) ..."
	-@git archive --format=tar --prefix=xbps-src-$(VERSION)/ \
		v$(VERSION) | gzip -9 > ~/xbps-src-$(VERSION).tar.gz
