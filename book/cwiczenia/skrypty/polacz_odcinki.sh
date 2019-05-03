#!/bin/bash

# Nazwa pliku z sekwencjami
surowy=nad2_A_thaliana.fasta
# Plik wyjściowy
file=polaczony_$surowy

# Kopiujemy plik z sekwencjami do pliku wyjściowego, 
# który będziemy modyfikować
cp $surowy $file

# Usuwanie linii z opisami, czyli linii zaczynających się od znaku > 
sed -i '/^>/d' $file

# Łączymy wszystkie linie w jedną, usuwając oznaczenia końca linii
# Wynik umieszczamy w pliku tymczasowym
cat $file | tr -d "\n" > $file.tmp

# Zmieniamy na sekwencję komplementarną, wynik umieszczamy 
# w drugim pliku wyjściowym

cat $file.tmp | tr "ACGT" "TGCA" > $file.tmp2
# Odwracamy sekwencję, wynik umieszczamy w pliku wyjściowym 
# zmieniając jego zawartość

cat $file.tmp2 | rev > $file

# Wstawiamy pierwszą linię z opisem i znak nowej linii
sed -i '1s/^/>NC_001284_Arabidopsis_thaliana_nad2\n/' $file

# Usuwamy pliki tymczasowe
rm $file.tmp*

