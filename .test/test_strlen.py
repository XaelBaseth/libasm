import ctypes
import os

# Charger la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

# Charger la bibliothèque standard C
libc = ctypes.CDLL("libc.so.6")
    # Définir le prototype de la fonction _ft_strlen
libasm._ft_strlen.restype = ctypes.c_size_t
libasm._ft_strlen.argtypes = [ctypes.c_char_p]

    # Définir le prototype de la fonction strlen
libc.strlen.restype = ctypes.c_size_t
libc.strlen.argtypes = [ctypes.c_char_p]

def test_ft_strlen():
    test_str = b"Hello, libasm!"
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)  # La longueur attendue
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strlen_empty():
    test_str = b""
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strlen_spaces():
    test_str = b"   "
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strlen_special_chars():
    test_str = b"Hello, \n\tlibasm!"
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strlen_long():
    test_str = b"a" * 1000  # Chaîne de 1000 'a'
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strlen_non_ascii():
    test_str = "こんにちは".encode('utf-8')  # "Hello" en japonais
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strlen_embedded_null():
    test_str = b"Hello\0World"
    result = libasm._ft_strlen(test_str)
    expected = libc.strlen(test_str)
    assert result == expected, f"Expected {expected}, but got {result}"


# Exécuter le test
test_ft_strlen()
test_ft_strlen_empty()
test_ft_strlen_spaces()
test_ft_strlen_special_chars()
test_ft_strlen_long()
test_ft_strlen_non_ascii()
test_ft_strlen_embedded_null()
