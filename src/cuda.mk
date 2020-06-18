CC = /usr/local/cuda/bin/nvcc
CFLAGS = -DHAVE_CONFIG_H -I. -Inetgpu -DUSE_CUDA -g -O2

SRCS = \
	cjson.c \
	dscp.c \
	iperf_api.c \
	iperf_auth.c \
	iperf_client_api.c \
	iperf_error.c \
	iperf_locale.c \
	iperf_sctp.c \
	iperf_server_api.c \
	iperf_tcp.c \
	iperf_time.c \
	iperf_udp.c \
	iperf_util.c \
	main.c \
	net.c \
	tcp_info.c \
	timer.c \
	units.c \


OBJS = $(patsubst %.c,%.o,$(SRCS))

LIBS = -lssl -lcrypto -lm -Lnetgpu -lcuda -lnetgpu

all: iperf3

iperf3: $(OBJS)
	$(CC) -o $@ $^ $(LIBS)

clean:
	rm -rf iperf3 $(OBJS)
