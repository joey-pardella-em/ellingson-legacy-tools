#!/usr/bin/env python3
"""
scrapes interesting stuff from log files
looks for creds, ips, usernames, etc
"""
import re
import sys
import os

patterns = {
    'ip': r'\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b',
    'email': r'[\w.-]+@[\w.-]+\.\w+',
    'user': r'user[name]*[=:]\s*["\']?(\w+)',
    'pass': r'pass(?:word)?[=:]\s*["\']?([^\s"\']+)',
}

def scrape_file(filepath):
    findings = {k: set() for k in patterns}
    try:
        with open(filepath, 'r', errors='ignore') as f:
            content = f.read()
            for name, pattern in patterns.items():
                matches = re.findall(pattern, content, re.I)
                findings[name].update(matches)
    except Exception as e:
        print(f"[-] Error: {e}")
    return findings

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("usage: log_scraper.py <file_or_dir>")
        sys.exit(1)

    target = sys.argv[1]
    if os.path.isfile(target):
        results = scrape_file(target)
        for k, v in results.items():
            if v:
                print(f"\n[{k}]")
                for item in v:
                    print(f"  {item}")
