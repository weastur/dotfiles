import io
import os
import sys

inp = input
out = []
if "LOCAL" not in os.environ:
    input_buffer = io.BytesIO(os.read(0, os.fstat(0).st_size))
    inp = lambda: input_buffer.readline().rstrip(b"\n").rstrip(b"\r")  # noqa



sys.stdout.write("\n".join(map(str, out)))
