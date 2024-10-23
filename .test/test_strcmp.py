import ctypes
import os

# Charger la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

# Charger la bibliothèque standard C
libc = ctypes.CDLL("libc.so.6")

# Prototypes des fonctions

libasm._ft_strcmp.restype = ctypes.c_int
libasm._ft_strcmp.argtypes = [ctypes.c_char_p, ctypes.c_char_p]

libasm.strcmp.restype = ctypes.c_int
libasm.strcmp.argtypes = [ctypes.c_char_p, ctypes.c_char_p]

def test_ft_strcmp_equal():
    str1 = b"Hello"
    str2 = b"Hello"
    result = libasm._ft_strcmp(str1, str2)
    expected = libc.strcmp(str1, str2)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcmp_different():
    str1 = b"Hello"
    str2 = b"World"
    result = libasm._ft_strcmp(str1, str2)
    expected = libc.strcmp(str1, str2)
    assert result == expected, f"Expected {expected}, but got {result}"