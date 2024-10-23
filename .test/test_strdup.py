import ctypes
import os

# Charger la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

# Charger la bibliothèque standard C
libc = ctypes.CDLL("libc.so.6")

# Prototypes des fonctions


libasm._ft_strdup.restype = ctypes.c_char_p
libasm._ft_strdup.argtypes = [ctypes.c_char_p]

# Tests pour ft_strdup
def test_ft_strdup():
    test_str = b"Hello, libasm!"
    result = libasm._ft_strdup(test_str)
    expected = libc.strdup(test_str)
    assert result == expected, f"Expected {expected.decode()}, but got {result.decode()}"