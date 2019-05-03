#!/bin/bash

# Tworzenie zmiennej tablicowej
sekwencje=(atp1 atp6 matR cox1)

# Drukowanie na raz całej zawartości zmiennej tablicowej
echo ${sekwencje[@]}

# Drukowanie kolejnych wartości
echo ${sekwencje[0]}
echo ${sekwencje[1]}
echo ${sekwencje[2]}
echo ${sekwencje[3]}
