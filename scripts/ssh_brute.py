#!/usr/bin/env python3
"""
ssh brute forcer - INCOMPLETE
gave up on this one, too slow without threading

maybe finish later
"""
import sys

# STUB - never finished this

def try_login(host, username, password):
    # would need paramiko here
    # pip install paramiko
    # but never got around to it
    pass

def brute_force(host, userlist, passlist):
    print("[-] This script is incomplete")
    print("[-] Need to add paramiko support")
    print("[-] Also needs threading to be useful")
    return None

if __name__ == '__main__':
    if len(sys.argv) < 4:
        print("usage: ssh_brute.py <host> <userlist> <passlist>")
        print("NOTE: this script is incomplete and doesn't actually work")
        sys.exit(1)

    brute_force(sys.argv[1], sys.argv[2], sys.argv[3])
