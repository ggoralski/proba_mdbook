#!/bin/bash

# Zmienna nr
nr=1

# Tworzymy zmienną tablicową:
sekwencje=(atp1 atp6 atp8 matR)

# Pętla 'for', która odczytuje argumenty ze zmiennej tablicowej 
# Kolejne wartości są przypisywane zmiennej 'argument'
for sekwencja in ${sekwencje[@]}
do
	# Drukowanie wartości
	echo "Sekwencja $nr = $sekwencja"
	nr=$((nr+1))
done
