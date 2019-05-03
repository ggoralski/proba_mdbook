#!/bin/bash
# Plik z danymi podany jako argument 1 przy uruchamianiu skryptu
data=$1
# Plik wyjściowy podany jako argument 2 przy uruchamianiu skryptu
fileout=$2
# Numer sekwencji w GenBank-u podany jako argument 3
nrGB=$3

# Tworzymy plik wejściowy, jeśli już istnieje to jego zawartość zostaje usunięta
echo > $fileout

# Pętla. Wartości start i stop odczytywane są z pliku $data
while read start stop
do
	# Skrypt informuje, który fragment pobiera
	echo "Pobieram fragment: $start - $stop z sekwencji $nrGB i zapisuję do pliku $fileout"
	# Pobranie fragmentu i zapisanie do pliku
	efetch -db nuccore -id $nrGB -format fasta -seq_start $start -seq_stop $stop >> $fileout
done < $data
