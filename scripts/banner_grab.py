#!/usr/bin/env python3
"""
simple banner grabber
connects to services and grabs their banners
"""
import socket
import sys

COMMON_PORTS = [21, 22, 23, 25, 80, 110, 143, 443, 993, 995, 3306, 5432]

def grab_banner(host, port, timeout=3):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(timeout)
        sock.connect((host, port))

        # send a probe for HTTP
        if port in [80, 443, 8080, 8443]:
            sock.send(b"HEAD / HTTP/1.0\r\n\r\n")

        banner = sock.recv(1024)
        sock.close()
        return banner.decode('utf-8', errors='ignore').strip()
    except:
        return None

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("usage: banner_grab.py <host> [port1,port2,...]")
        sys.exit(1)

    host = sys.argv[1]
    ports = COMMON_PORTS

    if len(sys.argv) > 2:
        ports = [int(p) for p in sys.argv[2].split(',')]

    print(f"[*] Grabbing banners from {host}")
    for port in ports:
        banner = grab_banner(host, port)
        if banner:
            print(f"\n[+] {host}:{port}")
            print(f"    {banner[:200]}")
