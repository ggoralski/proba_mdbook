#!/bin/bash

# Zmienna nr
nr=1

# Pętla 'for', która odczytuje argumenty przekazane do skryptu
# przechowywane w zmiennej tablicowej $@
# Kolejne argumenty są przypisywane zmiennej 'argument'
for argument in $@
do
	# Drukowanie wartości
	echo "Argument $nr = $argument"
	# Zwiększanie wartości zmiennej 'nr' o 1
	nr=$((nr+1))
done
