import ctypes
import os

# Charger la bibliothèque partagée
libasm = ctypes.CDLL(os.path.join(os.path.dirname(__file__), '../libasm.so'))

# Charger la bibliothèque standard C
libc = ctypes.CDLL("libc.so.6")

# Prototypes de la fonction ASM
libasm._ft_strcpy.restype = ctypes.c_char_p
libasm._ft_strcpy.argtypes = [ctypes.c_char_p, ctypes.c_char_p]

# Prototype de la fonction C
libc.strcpy.restype = ctypes.c_char_p
libc.strcpy.argtypes = [ctypes.c_char_p, ctypes.c_char_p]

def test_ft_strcpy():
    src = b"Hello, world!"
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcpy_empty():
    src = b""
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcpy_spaces():
    src = b"        "
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcpy_special_chars():
    src = b"Hello,\n\tWorld!"
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcpy_long_string():
    src = b"A" * 1000
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcpy_embedded_null():
    src = ctypes.create_string_buffer(b"Hello\0World")  # Chaîne avec un NULL au milieu
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

def test_ft_strcpy_non_ascii():
    src =  "こんにちは".encode('utf-8')
    dest = ctypes.create_string_buffer(len(src) + 1)
    result = libasm._ft_strcpy(dest, src)
    expected = libc.strcpy(dest, src)
    assert result == expected, f"Expected {expected}, but got {result}"

# Exécuter le test
test_ft_strcpy()
test_ft_strcpy_empty()
test_ft_strcpy_special_chars()
test_ft_strcpy_long_string()
test_ft_strcpy_embedded_null()
test_ft_strcpy_non_ascii()