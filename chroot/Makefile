include ../vars.mk

.PHONY: clean
clean:

.PHONY: install
install:
	install -d $(DESTDIR)$(SHAREDIR)/chroot
	install -m 644 *.plist $(DESTDIR)$(SHAREDIR)/chroot

.PHONY: uninstall
uninstall:
	-rm -rf $(DESTDIR)$(SHAREDIR)/chroot
