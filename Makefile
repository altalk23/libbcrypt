all:
	$(MAKE) -C src/lib
	$(MAKE) -C src/test

install:
	$(MAKE) -C src/lib install

check: all
	$(MAKE) -C src/test check

clean:
	$(MAKE) -C src/lib  clean
	$(MAKE) -C src/test clean

distclean: clean

crypt_blowfish-1.3.tar.gz:
	curl -LO https://www.openwall.com/crypt/$@

uncompress: crypt_blowfish-1.3.tar.gz
	tar vxf $< -C src/lib && \
	cd src/lib && \
	rm -rf crypt_blowfish && \
	mv crypt_blowfish-1.3 crypt_blowfish

.PHONY: all install clean
