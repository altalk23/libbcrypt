CC     ?= cc

override CFLAGS   = -fpic
override CPPFLAGS = -I../lib
override LDFLAGS  = -L../lib -lbcrypt

test.o: test.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -DTEST_BCRYPT -c $^

test: test.o
	$(CC) $(LDFLAGS) -o $@ $^

check: test
	./$^

clean:
	rm -f *.o test 

distclean: clean

.PHONY: clean
