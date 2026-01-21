#!/usr/bin/env python3
"""
checks hashes against common password lists
offline version, doesn't phone home
"""
import hashlib
import sys

def load_wordlist(path):
    try:
        with open(path, 'r', errors='ignore') as f:
            return [line.strip() for line in f]
    except:
        return []

def crack_md5(target_hash, wordlist):
    for word in wordlist:
        if hashlib.md5(word.encode()).hexdigest() == target_hash.lower():
            return word
    return None

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("usage: hash_lookup.py <hash> <wordlist>")
        sys.exit(1)

    result = crack_md5(sys.argv[1], load_wordlist(sys.argv[2]))
    if result:
        print(f"[+] Found: {result}")
    else:
        print("[-] Not found")
