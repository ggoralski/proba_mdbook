#!/bin/bash

# Nazwa pliku z danymi podana jako pierwszy argument
dane=$1
# Nazwa pliku wynikowego podana jako drugi argument
fileout=$2

# Tworzony jest plik wynikowy, jeśli istnieje zostaje nadpisany
echo > $fileout

# Pętla odczytująca numery sekwencji z pliku $dane,
# są one przechowywane w zmiennej nrGB
while read nrGB
do
    # Informacje o obieraniu i zapisywaniu sekwencji
    echo "Pobieram sekwencję $nrGB i zapisuję do pliku $fileout"
    # Pobieranie i zapisywanie sekwencji
    efetch -db nucleotide -id $nrGB -format fasta >> $fileout
done < $dane
