import ctypes
import os

# Chargement de la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

def test_ft_strlen():
    # Définir le prototype de la fonction
    libasm.ft_strlen.restype = ctypes.c_size_t
    libasm.ft_strlen.argtypes = [ctypes.c_char_p]

    test_str = b"Hello, libasm!"
    result = libasm.ft_strlen(test_str)
    expected = 14  # La longueur attendue

    assert result == expected, f"Expected {expected}, but got {result}"
