import io
import os
import platform
import sys

if platform.system() != "Darwin":
    input_buffer = io.BytesIO(os.read(0, os.fstat(0).st_size))
    inp = lambda: input_buffer.readline().rstrip(b"\n").rstrip(b"\r")  # noqa
else:
    inp = input
out = []



sys.stdout.write("\n".join(map(str, out)))
