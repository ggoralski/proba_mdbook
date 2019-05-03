#!/bin/bash

# Zmienne przechowujące liczby
liczba1=12
liczba2=6

# Wykonujemy działanie arytmetyczne - wyrażenie zamknięte w $[]
suma=$[liczba1+liczba2]
echo "suma: $liczba1 + $liczba2 = $suma"
# inny sposób - wyrażenie zamknięte w $(())
iloczyn=$((liczba1*liczba2))
echo "iloczyn: $liczba1 * $liczba2 = $iloczyn"
# Jeszcze inny sposób - polecenie let
# Uwaga - brak znaku $ przy nazwach zmiennych do których się odwołujemy
let roznica=liczba1-liczba2
echo "różnica: $liczba1 - $liczba2 = $roznica"

# Można oczywiście mieszać zmienne i liczby a wynik niekoniecznie
# trzeba przypisywać do zmiennej

echo "kolejne obliczenia: $liczba1 + 20 = $[liczba1 + 20]"

