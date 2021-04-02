uncompress: crypt_blowfish-1.3.tar.gz
	tar vxf $< -C src/lib && \
	cd src/lib && \
	rm -rf crypt_blowfish && \
	mv crypt_blowfish-1.3 crypt_blowfish

crypt_blowfish-1.3.tar.gz:
	curl -LO https://www.openwall.com/crypt/$@
