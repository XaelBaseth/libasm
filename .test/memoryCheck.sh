#!/bin/bash

# Compiler la bibliothèque partagée
cd ..
make test

# Exécuter les tests avec Valgrind
valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-out.txt python3 -m pytest
