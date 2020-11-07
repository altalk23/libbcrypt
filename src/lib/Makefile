CC     ?= cc
AR     ?= ar

CFLAGS  = $(shell grep '^CFLAGS = ' crypt_blowfish/Makefile | cut -d= -f2-)
ARFLAGS = rs

OBJS=$(patsubst %.c, %.o, bcrypt.c $(wildcard crypt_blowfish/*.c))

TARGET_ARCH=$(shell uname -m)

ENABLE_ASM = 1

ifeq ($(ENABLE_ASM), 1)
ifeq ($(findstring x86, $(TARGET_ARCH)), x86)
    OBJS += crypt_blowfish/x86.o
else ifneq ($(filter i%86, $(TARGET_ARCH)),)
    OBJS += crypt_blowfish/x86.o
endif
endif

all: libbcrypt.a

libbcrypt.a: $(OBJS)
	$(AR) $(ARFLAGS) $@ $^

bcrypt.o: bcrypt.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $^

crypt_blowfish/%.o:
	$(MAKE) -C crypt_blowfish TARGET_ARCH=$(TARGET_ARCH) ENABLE_ASM=$(ENABLE_ASM)

install: all
	install -d                 $(PREFIX)/{include,lib}
	install -m 644    bcrypt.h $(PREFIX)/include
	install -m 644 libbcrypt.a $(PREFIX)/lib

clean:
	rm -f *.o libbcrypt.a
	$(MAKE) -C crypt_blowfish clean

distclean: clean

.PHONY: clean
