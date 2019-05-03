#!/bin/bash
# Nazwa katalogu na pliki wynikowe
katalog="sekwencje"

# Tworzymy katalog dla plików wynikowych
mkdir sekwencje

# Pętla, która odczytuje dane z pliku i przypisuje je do zmiennych
while read nazwa numer sekwencja
do
	# Tworzymy nazwę pliku wynikowego: nazwa sekwencji + '.fasta`
	file=${nazwa}.fasta
	# Drukowanie nazwy pliku i odczytanych danych z linii
	echo "$file: $nazwa - $numer - $sekwencja"
	# Zapisanie opisu sekwencji do pliku
	echo ">$numer" > $katalog/$file
	# Dołączenie do pliku sekwencji
	echo $sekwencja >> $katalog/$file
# Dane pochodzą z pliku 'dane.tsv'	
done < dane.tsv


