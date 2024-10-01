import ctypes
import os

# Charger la bibliothèque libasm.a
libasm = ctypes.CDLL(os.path.abspath('./libasm.a'))

# Déclarer ft_strlen (vous devrez peut-être ajuster le type de retour et d'argument)
libasm.ft_strlen.argtypes = [ctypes.c_char_p]
libasm.ft_strlen.restype = ctypes.c_size_t

def test_ft_strlen():
    # Créer des chaînes de test
    test_str = b"Hello, world!"
    result = libasm.ft_strlen(test_str)
    
    # Vérifier que la longueur est correcte
    assert result == len(test_str), f"Expected {len(test_str)} but got {result}"
