#!/bin/bash

# wszystkie argumenty przekazywane :
echo "Argumenty: $@"

# Wywołujemy poszczególne argumenty
echo "argument 1: $1"
echo "argument 2: $2"

# Argumenty, które mają konkretne znaczenie lepiej przypisać do zmiennych
# których nazwy tłumaczą ich znaczenie
plik=$1
tekst=$2

# Teraz posługujemy się już utworzonymi zmeinnymi
echo $tekst > $plik
echo "Zawartość pliku $plik"
cat $plik
