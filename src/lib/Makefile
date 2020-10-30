CC     ?= cc
AR     ?= ar

CFLAGS  = $(shell grep '^CFLAGS = ' crypt_blowfish/Makefile | cut -d= -f2-)
ARFLAGS = rs

OBJS=$(patsubst %.c, %.o, bcrypt.c $(wildcard crypt_blowfish/*.c)) crypt_blowfish/x86.o


all: libbcrypt.a

libbcrypt.a: $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

bcrypt.o: bcrypt.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^

crypt_blowfish/%.o:
	$(MAKE) -C crypt_blowfish

install: all
	install -d                 $(PREFIX)/{include,lib}
	install -m 644    bcrypt.h $(PREFIX)/include
	install -m 644 libbcrypt.a $(PREFIX)/lib

clean:
	rm -f *.o libbcrypt.a
	$(MAKE) -C crypt_blowfish clean

distclean: clean

.PHONY: clean
