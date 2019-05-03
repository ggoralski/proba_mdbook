#!/bin/bash

katalog="sekwencje"

# Pętla, która odczytuje wszystkie pliki 'fasta' w katalogu
# oraz drukuje ich zawartość
for file in $katalog/*.fasta
do 
	echo "Plik: $file"
	cat $file
done
