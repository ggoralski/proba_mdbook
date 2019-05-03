#!/bin/bash

# Przykłady wykorzystania zmiennych

#Tworzymy dwie zmienne przechowujące łańcuchy znaków:
plik=tekst.txt
# Tu w łańcuchu znaków znajdują się spacje, dlatego konieczne są cudzysłowy
tekst="To jest tekst, który wpiszemy do pliku"

# Odwołania do wartości zmiennych
echo "Nazwa pliku: $plik"
echo $tekst
echo "Wpisuję do pliku:  $tekst" > $plik
echo "Zawartość pliku:"
cat $plik

# Zmienne przechowujące liczby
liczba1=12
liczba2=6

# Wykonujemy działanie arytmetyczne
suma=$[liczba1+liczba2]
echo "suma: $liczba1 + $liczba2 = $suma"
# inny sposób:
iloczyn 
