OVERLAY	=  tpm-slb9670
DTS	=  $(OVERLAY)-overlay.dts
DTBO	=  $(OVERLAY).dtbo
DTC	?= dtc

all: $(DTBO)
install: $(DTBO)
	install -d $(DESTDIR)/boot/uboot/overlays
	install -t $(DESTDIR)/boot/uboot/overlays $(DTBO)
	install -d $(DESTDIR)/usr/sbin
	install -t $(DESTDIR)/usr/sbin rpi-tpm2-slb9670-hwe

%.dtbo: %-overlay.dts
	$(DTC) -@ -I dts -O dtb -o $@ $<
