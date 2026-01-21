#!/usr/bin/env python3
"""
quick recon script for mapping internal networks
nothing special, just saves time
"""
import socket
import sys

def scan_range(base_ip, start, end):
    for i in range(start, end + 1):
        ip = f"{base_ip}.{i}"
        try:
            socket.setdefaulttimeout(0.5)
            socket.socket().connect((ip, 22))
            print(f"[+] {ip}:22 open")
        except:
            pass

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("usage: recon.py <base_ip> [start] [end]")
        sys.exit(1)
    base = sys.argv[1]
    start = int(sys.argv[2]) if len(sys.argv) > 2 else 1
    end = int(sys.argv[3]) if len(sys.argv) > 3 else 254
    scan_range(base, start, end)
