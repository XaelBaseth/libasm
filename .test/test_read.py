import ctypes
import os

# Charger la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

# Charger la bibliothèque standard C
libc = ctypes.CDLL("libc.so.6")

# Prototypes des fonctions

libasm._ft_read.restype = ctypes.c_ssize_t
libasm._ft_read.argtypes = [ctypes.c_int, ctypes.c_void_p, ctypes.c_size_t]

libasm.read.restype = ctypes.c_ssize_t
libasm.read.argtypes = [ctypes.c_int, ctypes.c_void_p, ctypes.c_size_t]

# Tests pour ft_read
def test_ft_read():
    fd = os.open('test_file.txt', os.O_RDONLY)
    buffer = ctypes.create_string_buffer(100)
    result = libasm._ft_read(fd, buffer, 100)
    expected = libc.read(fd, buffer, 100)
    os.close(fd)
    assert result == expected, f"Expected {expected}, but got {result}"