#!/usr/bin/env python
# TODO: explain why we need this

import os
import sys

shell = os.environ["CI_OVERRIDE_SHELL"]
os.execvp(shell, [shell] + sys.argv[1:])
