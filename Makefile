SRCS+= adb.c
SRCS+= adb_client.c
SRCS+= commandline.c
SRCS+= console.c
SRCS+= file_sync_client.c
SRCS+= fdevent.c
SRCS+= get_my_path_linux.c
SRCS+= services.c
SRCS+= sockets.c
SRCS+= transport.c
SRCS+= transport_local.c
SRCS+= transport_usb.c
SRCS+= usb_linux.c
SRCS+= usb_vendors.c
SRCS+= utils.c
SRCS+= adb_auth_host.c
 
VPATH+= ./libcutils
SRCS+= abort_socket.c
SRCS+= socket_inaddr_any_server.c
SRCS+= socket_local_client.c
SRCS+= socket_local_server.c
SRCS+= socket_loopback_client.c
SRCS+= socket_loopback_server.c
SRCS+= socket_network_client.c
SRCS+= list.c
SRCS+= load_file.c
 
VPATH+= ./libzipfile
SRCS+= centraldir.c
SRCS+= zipfile.c
 
VPATH+= ./zlib/src
SRCS+= adler32.c
SRCS+= compress.c
SRCS+= crc32.c
SRCS+= deflate.c
SRCS+= infback.c
SRCS+= inffast.c
SRCS+= inflate.c
SRCS+= inftrees.c
SRCS+= trees.c
SRCS+= uncompr.c
SRCS+= zutil.c

CPPFLAGS+= -DADB_HOST=1
CPPFLAGS+= -DHAVE_FORKEXEC=1
CPPFLAGS+= -DHAVE_SYMLINKS
CPPFLAGS+= -DHAVE_TERMIO_H
CPPFLAGS+= -D_GNU_SOURCE
CPPFLAGS+= -D_XOPEN_SOURCE
CPPFLAGS+= -fPIC
CPPFLAGS+= -I .
CPPFLAGS+= -I ./include
#CPPFLAGS+= -I /usr/local/ssl/include
CPPFLAGS+= -I ./zlib
CPPFLAGS+= -L ../openssl-lib/x86/ssl/lib
#CPPFLAGS+= -L ../openssl-lib/arm/openssl/lib

CFLAGS+= -O2 -g -Wall -Wno-unused-parameter
LDFLAGS= -static
LIBS= -lrt -lpthread -lcrypto -ldl
 
#TOOLCHAIN= arm-linux-
TOOLCHAIN= 
CC= $(TOOLCHAIN)gcc
LD= $(TOOLCHAIN)gcc

#CC= gcc
#LD= gcc

OBJS= $(SRCS:.c=.o)
 
all: adb
 
adb: $(OBJS)
	$(LD) -o $@ $(LDFLAGS) $(OBJS) $(LIBS)
 
clean:
	rm -rf $(OBJS)
