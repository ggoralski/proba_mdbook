[← Spis treści](../README.md)
# Skrypty w Linuksie

## Po co pisać skrypty?

Podczas pracy w konsoli często wykonujemy wielokrotnie po kolei te same komendy, czasem nieco zmienione na przykład poprzez podanie innych plików wejściowych czy parametrów uruchamianych programów. Między innymi w takich wypadkach lepiej jest umieścić je w skrypcie, czyli pliku tekstowym, który uruchamia po kolei wpisane w nim komendy.
Umieszczanie poleceń w skryptach ma jeszcze tę zaletę, że stanowi on dobrą dokumentację wykonywanych operacji.
Pisanie skryptów jest w zasadzie programowaniem. Będziemy tu używać powłoki `Bash`. Poza możliwościami uruchamiania różnych poleceń/programów, z czym mieliśmy dotychczas do czynienia, udostępnia ona także wiele elementów charakterystycznych dla języków programowania jak zmienne, kolekcje elementów czy pętle. Tutaj pokażę tylko kilka podstawowych elementów programowania w `bash`-u.   

## Pierwszy skrypt

Utwórz plik tekstowy o nazwie `pierwszy_skrypt.sh`. Umieść w nim kilka linii:

```bash
#!/bin/bash

# Pierwszy skrypt

echo "Witaj Świecie!"
pwd
ls
# Tworzenie katalogu i pliku tekstowego
mkdir TMP
touch TMP/tekst.txt
# Umieszczenie tekstu w pliku
echo "Tekst w pliku" > TMP/tekst.txt
# Wypisanie zawartości pliku
cat TMP/tekst.txt
```

Przed uruchomieniem pliku musimy jeszcze dokonać pewnej modyfikacji. Samo przedłużenie `.sh` (które zresztą jest opcjonalne) nie sprawia, że plik jest uruchamialny, najpierw trzeba mu nadać odpowiednie prawa:

```
chmod u+x pierwszy_skrypt.sh 
```

Teraz można skrypt uruchomić:

```
$: ./pierwszy_skrypt.sh 
Witaj Świecie!
/home/student/skrypty
pierwszy_skrypt.sh
Tekst w pliku
```

Zauważ, że plik uruchamiamy podając przed nazwą `./`, jeśli skrypt znajduje się w bieżącym katalogu. Jeśli nie, to podajemy do niego pełną ścieżkę (są jeszcze inne rozwiązania jak np. umieszczanie skryptu w katalogach, w których domyślnie powłoka szuka programów/skryptów).

Uruchomiony skrypt, jak widać, wykonał po kolei umieszczone w nim polecenia. Tajemniczo może wyglądać pierwsza linia. Znak `#` wskazuje na linię komentarza - czyli wszystko poza nim nie jest interpretowane przez powłokę. W tym przypadku, pierwszej linii skryptu, w połączeniu ze znakiem `!`, wskazuje jakiej powłoki (języka) użyć do uruchomienia poleceń w skrypcie.  
Skoro jednak już wspomniałem o komentarzach w skryptach to parę słów na ten temat. W komentarzach zwykle umieszczamy informacje na temat tego jaka jest ogólna funkcja skryptu, jak go używać, jak skrypt działa, czemu służą poszczególne polecenia itp. Przy pisaniu skryptów warto poświęcić trochę czasu aby go prawidłowo opisać w komentarzach. Po pierwsze sprzyja to dokumentacji pracy, po drugie jeśli po pewnym czasie wrócimy do skryptu, nie będziemy tracić czasu na przypominanie sobie ,,co autor miał na myśli''. 

# Zmienne 

Zmienne pozwalają przechować a następnie wykorzystać pewne wartości, np. liczby, łańcuchy znaków.

Na początek utwórz plik `zmienne.sh` z taką zawartością:

```
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
```

Zauważ, że przy tworzeniu zmiennych nie używamy znaku `$` przy ich nazwie (`plik`, `tekst`), natomiast kiedy się do nich odwołujemy, umieszczamy znak `$` na początku (`$plik`, `$tekst`). Przy znaku `=` nie można wstawiać spacji. Znak `$` czasem znajduje się w innym miejscu, co można zobaczyć np. na kolejnym przykładzie w którym pokażę jak używać zmiennych przechowujących liczby do prostych obliczeń:

```
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
```

# Parametry (argumenty) przekazywane do skryptu i zmienne specjalne

Przy uruchamianiu skryptu, można przekazać parametry, takie jak np. nazwy plików z danymi, nazwy sekwencji, nazwy analizowanych gatunków itd. Podajemy je po nazwie skryptu, oddzielone spacjami. Jeśli przekazany parametr (np. tekst) zawiera spacje to całość obejmujemy cudzysłowami. Kolejne parametry przyjmują w skrypcie nazwy od $1 do $9. Nie oznacza to, że nie można ich przekazać więcej, ale można się do nich odwołać w inny sposób, np. używając pętli. Wszystkie parametry są przechowywane w `$@`.

W skrypcie można się posługiwać domyślnymi nazwami (`$1`..`$2`) ale dla przejrzystości kodu lepiej ich wartość przypisać do zmiennych o nazwach, które odpowiadają ich funkcji. Na przykład jeśli parametr jest nazwą pliku, to zienna może nazywać się `plik` albo `plik_wejsciowy`.


Utwórz skrypt `argumenty.sh`, nadaj mu uprawnienia wykonywalności.

```
#!/bin/bash

# wszystkie argumenty przekazywane :
echo "Argumenty: $@"

# Wywołujemy poszczególne argumenty
echo "argument 1: $1"
echo "argument 2: $2"

# Argumenty, które mają konkretne znaczenie lepiej 
# przypisać do zmiennych których nazwy tłumaczą ich znaczenie
plik=$1
tekst=$2

# Teraz posługujemy się już utworzonymi zmeinnymi
echo $tekst > $plik
echo "Zawartość pliku $plik"
cat $plik
```

Teraz go uruchom z dwoma parametrami:

```
$: ./argumenty.sh argumenty.txt "Tekst przekazany jako argument"

Argumenty: argumenty.txt Tekst przekazany jako argument
argument 1: argumenty.txt
argument 2: Tekst przekazany jako argument
Zawartość pliku argumenty.txt
Tekst przekazany jako argument
```

Sprawdź zawartość pliku `argumenty.txt`.

Istnieje wiele innych zmiennych specjalnych i środowiskowych, które się mogą przydać, np:

  * `$0` - nazwa własna skryptu
  * `$HOME` - ścieżka do katalogu domowego bieżącego użytkownika
  * `$USER` - nazwa bieżącego użytkownika

## Zmienne tablicowe

Być może zwróciłeś uwagę, że powyższa zmienna `$@` przechowuje wiele wartości na raz. Jest to przykład **zmiennej tablicowej**. 

Zmienne tablicowe przydają się gdy chcemy przechować wiele elementów (które mogą odpowiadać wielu zmiennym). Za chwilę wrócimy do nich przy okazji pętli. Na razie prosty przykład jak utworzyć taką zmienną i wypełnić ją danymi (`zmienne_tablicowe.sh`):

```
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
```

W nawiasach kwadratowych znajduje się indeks (numer) wartości. Zauważ, że liczby zaczynają się od `0` a nie `1`. Wartość o indeksie `1` jest więc drugą a nie pierwszą. Znak `@` lub `*` oznacza wszystkie wartości.


## Zmienne i wynik polecenia

Zmienna może przechowywać wynik działania polecenia. W takim wypadku polecenie należy albo umieścić w parze odwrotnych apostrofów ``` `` ``` albo w parze nawiasów ze znakiem dolara `$()`.

Sprawdź na przykładzie jak to działa (`polecenia.sh`)

```
#!/bin/bash

# Dwa sposoby przypisania do zmiennej wyniku działania polecenia
# lista plików w katalogu /usr/bin zaczynających się od z
pliki=`ls /usr/bin/z*`
# linie zawierające `plik` w bieżącym skrypcie
linie=$(grep plik $0)

# Drukowanie zawartości zmiennych
echo "**** Znalezione pliki:"
echo "$pliki"
echo "**** Znalezione linie:" 
echo "$linie"
```

Przy okazji sprawdź jak zmienia się sposób wyświetlania zawartości zmiennych jeśli ich nazwy nie znajdą się w cudzysłowach.

## Pętle i czytanie wartości z pliku tekstowego

Pętle pozwalają na wielokrotne wykonywanie tych samych czynności, często ze zmienionymi parametrami. Nie będę tu gruntownie omawiał pętli, pokażę tylko kilka przykładów pętli, które można zastosować w dalszych etapach kursu.

### Pętla operująca na argumentach

Pierwszy przykład pokazuje jak coś zrobić z kolejnymi argumentami przekazywanymi do skryptu. Mogą to być np. nazwy plików z którymi będziemy coś robić (np. generować dla nich drzewa filogenetyczne). Na razie tylko wydrukujemy ich nazwy.

Skrypt `petla_argumenty.sh`

```
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
```

Teraz wywołaj skrypt z odpowiednimi parametrami:

```
$: /petla-argumenty.sh atp1.fasta atp6.fasta atp8.fasta matR.fasta
Argument 1 = atp1.fasta
Argument 2 = atp6.fasta
Argument 3 = atp8.fasta
Argument 4 = matR.fasta
```

Zamiast argumentów można użyć innej zmiennej tablicowej:

```
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
```

A teraz coś bardziej złożonego. Odczytywanie danych z pliku i wykorzystanie ich w pętli.

Najpierw utwórz plik tekstowy o nazwie `dane.tsv`. Przedłużenie `tsv` oznacza _tab-separated values_, więc dane oddziel tabulatorem a nie spacją. 
```
atp1	JX287332	ATAAATGACTAGAATTTGTTTTTCAATTGGAAGTGGTGCATATTGCGGTTGTTTCAGTAC
atp4	KX270773	TCAGAAGCATCTTCCATAGTCGTCTTGGTATTGGATCCGCTCTTCTGTTAGCATATTAAT
atp6	KU043163	AAACAAACGTTTTCCCCTCGCAACTCGGTTACTTTTACTTTTTTGTTATTTCGTAATCCC
atp8	KX270795	ATGCCTCAACTGGATAAATTCACTTATTTTACACAATTCTTCTGGTCATGCCTTTTCCTC
atp9	KX270765	TCAAAATACGAATGAAATCAAAAAGGCCATCATTAGGGCAAACAATGCGATCGCTTCGGT
```

W każdej linii znajduje się kolejno: nazwa sekwencji, numer GenBank z którego pochodzi fragment sekwencji i w końcu fragment sekwencji. Zwróć uwagę, żeby na dole pliku nie było pustej linii.

Teraz skrypt, który odczyta dane, a następnie na ich podstawie utworzy pliki z danymi (`czytaj_z_pliku.sh`)

```
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
```

Kolejna pętla odczytuje wszystkie pliki `fasta` z katalogu (`odczyt_plikow.sh`)

```
#!/bin/bash

katalog="sekwencje"

# Pętla, która odczytuje wszystkie pliki 'fasta' w katalogu
# oraz drukuje ich zawartość
for file in $katalog/*.fasta
do 
	echo "Plik: $file"
	cat $file
done
```

## Podsumowanie

Powyższe elementy pisania skryptów w `Bash`-u to jedynie czubek góry lodowej. Zachęcam do dalszego samodzielnego zgłębiania tej cennej umiejętności. W dalszej części kursu pokażę bardziej praktyczne przykłady jej wykorzystania.

[← Spis treści](../README.md)
