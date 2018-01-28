CC = gcc
LIBS=-lrt -lpcap
CPPFLAGS=-Wall

all: rx tx rx_status_test



%.o: %.c
	$(CC) -c -o $@ $< $(CPPFLAGS)


rx: rx.o lib.o radiotap.o fec.o
	$(CC) -o $@ $^ $(LIBS)


tx: tx.o lib.o fec.o
	$(CC) -o $@ $^ $(LIBS)


rx_status_test: rx_status_test.o
	$(CC) -o $@ $^ $(LIBS)

clean:
	rm -f rx tx *~ *.o

