# This init script only sets the REPL prompt.
import sys
sys.ps1 = "Python3> "
sys.ps2 = "........ "

from decimal import *
getcontext().prec = 1024
def real_value(n):
    return format(Decimal(n), '0.512f').rstrip("0")