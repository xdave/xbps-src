include ../vars.mk

SCRIPTS = chroot-helper.sh doinst-helper.sh
MOUNT_BIN = capmount
UMOUNT_BIN = capumount
CHROOT_BIN = capchroot
BINS = $(CHROOT_BIN) $(MOUNT_BIN) $(UMOUNT_BIN)
CPPFLAGS += -Wall -Werror
LDFLAGS += -lcap

.PHONY: all
all: $(BINS)

.PHONY: clean
clean:
	-rm -f $(BINS)

.PHONY: install
install:
	install -d $(DESTDIR)$(LIBEXECDIR)
	for bin in $(SCRIPTS); do					\
		install -m755 $$bin $(DESTDIR)$(LIBEXECDIR);		\
	done
	install -m755 $(MOUNT_BIN) $(DESTDIR)$(LIBEXECDIR)
	install -m755 $(UMOUNT_BIN) $(DESTDIR)$(LIBEXECDIR)
	install -m755 $(CHROOT_BIN) $(DESTDIR)$(LIBEXECDIR)
	@echo
	@echo "WARNING: capabilities must be set manually to some files."
	@echo "WARNING: run the following command as root to set them:"
	@echo "setcap cap_sys_admin=ep $(DESTDIR)$(LIBEXECDIR)/$(MOUNT_BIN)"
	@echo "setcap cap_sys_admin=ep $(DESTDIR)$(LIBEXECDIR)/$(UMOUNT_BIN)"
	@echo "setcap cap_sys_chroot=ep $(DESTDIR)$(LIBEXECDIR)/$(CHROOT_BIN)"
	@echo

.PHONY: uninstall
uninstall:
	for bin in $(BINS) $(SCRIPTS); do			\
		rm -f $(DESTDIR)$(LIBEXECDIR)/$$bin;		\
	done

$(MOUNT_BIN):
	$(CC) $(CFLAGS) $(CPPFLAGS) mount.c $(LDFLAGS) -o $@

$(UMOUNT_BIN):
	$(CC) $(CFLAGS) $(CPPFLAGS) umount.c $(LDFLAGS) -o $@

$(CHROOT_BIN):
	$(CC) $(CFLAGS) $(CPPFLAGS) chroot.c $(LDFLAGS) -o $@
