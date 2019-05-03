#!/bin/bash

# Dwa sposoby przypisania do zmiennej wyniku działania polecenia
# lista plików w katalogu /usr/bin zaczynających się od z
pliki=`ls /usr/bin/z*`
# linie zawierające `plik` w bieżącym skrypcie
linie=$(grep pliki $0)

# Drukowanie zawartości zmiennych
echo "**** Znalezione pliki:"
echo "$pliki"
echo "**** Znalezione linie:" 
echo "$linie"

