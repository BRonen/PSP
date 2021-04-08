OBJS = main.o

CFLAGS = -Wall -Wextra
CXXFLAGS = $(CFLAGS)

LIBS =

PSP_EBOOT_TITLE = Hello World
EXTRA_TARGETS = EBOOT.PBP
PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak