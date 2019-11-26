#!/usr/bin/env python3
# TODO: explain why we need this

import os
import sys
import subprocess

try:
    shell = os.environ["CI_OVERRIDE_SHELL"]
except KeyError:
    shell = "bash"

res = subprocess.run([shell] + sys.argv[1:])
exit(res.returncode)
