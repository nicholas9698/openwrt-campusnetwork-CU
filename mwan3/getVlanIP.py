import socket
import fcntl
import struct
import sys

def get_ipv4_address(ifname):
	s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	return socket.inet_ntoa(fcntl.ioctl(s.fileno(),0x8915,struct.pack(('256s').encode('utf-8'),ifname[:15].encode('utf-8')))[20:24])

if __name__ == "__main__":
    print(get_ipv4_address(sys.argv[1]))
