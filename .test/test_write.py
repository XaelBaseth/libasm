import ctypes
import os

# Charger la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

# Charger la bibliothèque standard C
libc = ctypes.CDLL("libc.so.6")

# Prototypes des fonctions

libasm._ft_write.restype = ctypes.c_ssize_t
libasm._ft_write.argtypes = [ctypes.c_int, ctypes.c_char_p, ctypes.c_size_t]

libasm.write.restype = ctypes.c_ssize_t
libasm.write.argtypes = [ctypes.c_int, ctypes.c_char_p, ctypes.c_size_t]

def test_ft_write():
    test_str = b"Hello, libasm!\n"
    fd = 1  # STDOUT
    result = libasm._ft_write(fd, test_str, len(test_str))
    expected = libc.write(fd, test_str, len(test_str))
    assert result == expected, f"Expected {expected}, but got {result}"