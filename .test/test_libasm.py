# test_libasm.py

import pytest
from ctypes import c_char_p, CDLL
import string

# Load the assembly library
libasm = CDLL('./libasm.a')  # Adjust the path as needed//Change to use the .a or create a .so for testing purpose

def test_ft_strlen_empty_string():
    assert libasm.ft_strlen(c_char_p(b'')) == 0

def test_ft_strlen_single_character():
    assert libasm.ft_strlen(c_char_p(b'a')) == 1

def test_ft_strlen_short_string():
    assert libasm.ft_strlen(c_char_p(b'hello')) == 5

def test_ft_strlen_long_string():
    long_str = b''.join([chr(i) for i in range(ord('a'), ord('z') + 1)] * 100)
    assert libasm.ft_strlen(c_char_p(long_str)) == len(long_str)

def test_ft_strlen_special_characters():
    special_chars = b'\x00\x01\x02\xfe\xff'
    assert libasm.ft_strlen(c_char_p(special_chars)) == len(special_chars)

def test_ft_strlen_null_pointer():
    with pytest.raises(ValueError):
        libasm.ft_strlen(None)

@pytest.mark.parametrize("input_string", [
    b'',
    b'a',
    b'hello',
    b'abcdefghijklmnopqrstuvwxyz',
    b'1234567890',
    b'!@#$%^&*()',
])
def test_ft_strlen_against_c_strlen(input_string):
    c_strlen = len(input_string)
    asm_strlen = libasm.ft_strlen(c_char_p(input_string))
    assert asm_strlen == c_strlen, f"Mismatch for '{input_string.decode()}': C strlen({c_strlen}), ASM strlen({asm_strlen})"
