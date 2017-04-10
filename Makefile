
SRCS_BASE=clear.c \
	compare.c\
	copy.c\
	gen_uuid.c\
	isnull.c\
	pack.c\
	parse.c\
	unpack.c\
	unparse.c\
	uuid_time.c
	
BUILD_DIR=$(shell pwd)/build
	
CFLAGS+=-I$(shell pwd)/include -I/usr/include/
	
SRCS=$(addprefix src/,$(SRCS_BASE))

OBJS=$(patsubst %.c,%.o,$(SRCS_BASE))

.PHONY: all test builddir clean
.DEFAULT_GOAL := all

$(OBJS) : $(SRCS)
	$(CC) -fPIC $(CFLAGS) -c $(addprefix src/, $(patsubst %.o, %.c, $@)) -o $(BUILD_DIR)/$@

all: builddir $(OBJS)
	$(CC) -shared -o libuuid.so $(addprefix $(BUILD_DIR)/,$(OBJS))
	
test: all
	$(CC) $(CFLAGS) src/test.c -o test -L$(shell pwd)/ -luuid
	
builddir:
	-mkdir $(BUILD_DIR)
	
clean:
	-rm -rf $(BUILD_DIR) libuuid.so test
