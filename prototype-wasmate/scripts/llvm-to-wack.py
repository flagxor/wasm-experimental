#!/usr/bin/env python

import argparse
import os
import re
import shlex
import subprocess
import sys


SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR= os.path.dirname(SCRIPT_DIR)
LLVM_TEST_DIR = os.path.join(ROOT_DIR, 'third_party', 'llvm', 'test', 'CodeGen',
                             'WebAssembly')
WACK_TEST_DIR = os.path.join(ROOT_DIR, 'test')
LLVM_DIR = os.path.join(ROOT_DIR, 'third_party', 'llvm')
BIN_DIR = os.path.join(LLVM_DIR, 'build', 'bin')


def FindTestFiles(directory, ext):
    tests = []
    for root, dirs, files in os.walk(directory):
        for f in files:
            path = os.path.join(root, f)
            if os.path.splitext(f)[1] == ext:
                tests.append(path)
    tests.sort()
    return tests


def GetRunLine(test):
    run_line = ''
    with open(test) as test_file:
        for line in test_file.readlines():
            m = re.match(r'; RUN: (.*?)(\\?)$', line)
            if m:
                run_line += m.group(1)
                if not m.group(2):
                    break
    # Remove FileCheck
    run_line = re.sub(r'\|\s*FileCheck.*$', '', run_line)
    # Remove pipe input
    run_line = re.sub(r'<\s*%s', '', run_line)
    # Remove stderr > stdout redirect
    run_line = re.sub(r'2>&1', '', run_line)
    return run_line


def main(args):
    parser = argparse.ArgumentParser()
    options = parser.parse_args(args)

    tests = FindTestFiles(LLVM_TEST_DIR, '.ll')
    for ll_test in tests:
        name_noext = os.path.splitext(os.path.basename(ll_test))[0]
        wack = os.path.join(WACK_TEST_DIR, name_noext + '.wack')
        run_line = GetRunLine(ll_test)
        cmd = shlex.split(run_line)
        cmd.extend([ll_test, '-o', wack])
        # First arg is llc or opt, replace it with one in our BIN_DIR
        cmd[0] = os.path.join(BIN_DIR, cmd[0])
        subprocess.check_call(cmd)


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
