[← Spis treści](../README.md)

# Praca z plikami tekstowymi w linii komend

## Dlaczego to takie ważne?

Jak już wspominałem, praca bioinformatyka to w dużej mierze, o ile nie przede wszystkim praca z plikami tekstowymi. W [poprzedniej lekcji](11-praca_w_linuksie.md) pokazałem jak umieścić tekst w pliku przy pomocy operatorów `>` oraz `>>` a także jak wyświetlić zawartość pliku używając komend `more`, `less` i `cat`. Linux oferuje jednak znacznie więcej narzędzi pozwalających na efektywną pracę z plikami tekstowymi bez uciekania się do pomocy edytorów tekstu (na które też przyjdzie pora). Poniżej pokażę wybrane możliwości niektórych z nich. Warto jednak samodzielnie poszerzyć wiedzę na ten temat, ponieważ potrafią znacznie usprawnić i przyspieszyć pracę. 

W terminalu utwórz katalog `Pliki_tekstowe` i wejdź do niego. Używając polecenia `curl` lub `wget` pobierz plik:

`http://ggoralski.pl/files/filogenetyka-data/Orobanchaceae-trnL-trnF-aligned.fasta`

## Liczenie zawartości i wyświetlanie części pliku - polecenia `wc`, `head`, `tail`.

Wykonaj polecenie:

```
$: wc Orobanchaceae-trnL-trnF-aligned.fasta 
  18   18 9254 Orobanchaceae-trnL-trnF-aligned.fasta
```

Komenda `wc` wyświetla liczbę linii, słów oraz wielkość liczoną w bajtach podanego pliku. Podając odpowiednie flagi, można uzyskać tylko wybrane dane (sprawdź `wc --help`), co później wykorzystamy.
W przypadku pobranego pliku liczba linii i słów jest taka sama (18) ponieważ w opisach i sekwencjach nie występują spacje a sekwencje zostały umieszczone każda w jednej linii. Sprawdź zatem inny plik:

`http://ggoralski.pl/files/filogenetyka-data/Orobanchaceae-trnL-trnF-aligned.aln` 

Zawiera on dopasowane sekwencje zapisane w formacie `CLUSTAL`. Zobacz jaka jest zawartość pliku a następnie sprawdź ile ma linii i słów.

Polecenie `wc` może odczytywać dane z wielu plików jednocześnie:

```
$: wc *
  233   490 17672 Orobanchaceae-trnL-trnF-aligned.aln
   18    18  9254 Orobanchaceae-trnL-trnF-aligned.fasta
  251   508 26926 razem
```

Nie zawsze konieczne jest przeglądanie całego pliku. Czasem chcemy po prostu zobaczyć jak wygląda jego początek i koniec. Wtedy przychodzą nam z pomocą polecenia `head` i `tail`, które jak łatwo zgadnąć wyświetlają odpowiednio początek i koniec pliku:

```
$: head Orobanchaceae-trnL-trnF-aligned.aln 
CLUSTAL 2.1 multiple sequence alignment


KY484464_O._teucrii                AGTTATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAAGAGAAA-GGGC
KY484493_O._flava                  AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAAGAAAAA-GGGC
KY484489_O._mayeri                 AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAATAAAAA-GGGC
KY484471_O._kochii                 AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAATAAAAA-GGGC
KY484474_O._elatior                AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAATAAAAA-GGGC
KU238865_O._coerulescens           AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAAGAAAAA-GGGC
KY484502_P._ramosa                 GGTGATAAC-TTTCAAATTCAGAGAAACTCCGGAATTAATAAAAACGGGC
$: tail Orobanchaceae-trnL-trnF-aligned.aln 
KY484464_O._teucrii                AAATG
KY484493_O._flava                  AAATG
KY484489_O._mayeri                 AAATG
KY484471_O._kochii                 AAATG
KY484474_O._elatior                AAATG
KU238865_O._coerulescens           GAATG
KY484502_P._ramosa                 GAATG
KY484503_P._purpurea               GAATG
KX524675_Lindenbergia_siniaca      GAATG
                                    ****
```

Liczbę wyświetlanych linii można dostosować używając flagi `-n`:

```
$: head -n 5 Orobanchaceae-trnL-trnF-aligned.aln 
CLUSTAL 2.1 multiple sequence alignment


KY484464_O._teucrii                AGTTATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAAGAGAAA-GGGC
KY484493_O._flava                  AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAAGAAAAA-GGGC
$: tail -n 5 Orobanchaceae-trnL-trnF-aligned.aln 
KU238865_O._coerulescens           GAATG
KY484502_P._ramosa                 GAATG
KY484503_P._purpurea               GAATG
KX524675_Lindenbergia_siniaca      GAATG
                                    ****
```

## `grep` - wyszukiwanie w pliku tekstowym

Narzędzie `grep` z pewnością należy do najbardziej użytecznych programów do pracy z plikami tekstowymi. Służy do wynajdywania w plikach danego ciągu znaków. 

W katalogu z pobranymi (patrz wyżej) plikami wykonaj polecenie:

```
$: grep Lindenbergia Orobanchaceae-trnL-trnF-aligned.fasta 
>KX524675_Lindenbergia_siniaca
```

W podanym pliku został znaleziony ciąg znaków `Lindenbergia` a następnie linia w którym się znajdował została wyświetlona. Jeśli znaleziony fragment nie wyświetla się w innym kolorze niż pozostała część linii to można to uzyskać podając opcję `--color=AUTO`, np. `grep --color=AUTO Lindenbergia Orobanchaceae-trnL-trnF-aligned.fasta`.

Można przeszukać od razu wiele plików np. używając znaków wieloznacznych, uzyskamy także informację w jakim pliku znaleziono dopasowanie:

```
$: grep Lindenbergia *          

Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      AGTGATAAC-TTTCAAATTCAGAGAAACCCCGGAATTAAAAAAGG-GGGC
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      AATCCTGAGCCAAATCCTGT-----TTTCTCAAAACAAA-G--------A
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      C-AAAAATAAAGGATAGGTGCAGAGACTCAACGGAAGCTGTTCTAAC---
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      -AAATGGAGTTGATTGCGCCGGTAGAGGAATCTTTCCATCGAAACTTCGG
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      AAAGGATGAAGGATAAACGTATCTATTGAATACTATATCAAATTATTAAT
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      GATATCAAATTATTAATGATGGCCCGAATCTGTATCTGTATTTTT---TA
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      ATTTTAATATGAAAAATGGAAAAGTTAGTGTGAATTGATTCCATATTGAA
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      GAAAGAATCGAATATTCATT-------CATCAAATCATTCACTCCACAGT
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      CCGATAGATC-----TTTTAAAGAATTGATTAATCGGATGAGAATAAAGA
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      TAGAGTCCCATTC----------TACATGTCAATACCGGCAACAATGAAA
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      TTTATAGTAAGAGGAAAATCCGTCGACTTTAAAAATCGTGAGGGTTCAAG
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      TCCCTCTATCCCCAA---AAAAAGTCTATTTTACTTCCA-----------
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      -----------AAATATTTAGCCTATTTCA-----------------TTT
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      TCG-TTAGCGGTTCCAAATTCCTT--TTCTGATTC--TTTGACA--AACG
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      TATTGGGGCGT------------------AAATGACTTT-CTCTTATCAC
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      ATGTG------ATATAGAATACACATCCAAATTCAGCAAGGAATTCCTAT
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      TTGAATG------ATTCAGAATCAATAACATTACTC-AT-ACTGAAACTT
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      AGA---AAGTTCGTCTTTTTGAAGATCCAATAAATTACAGGATTTGGAGA
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      AAACTTTGTAATCTTCCCCA--TCCCTTTAATTGACATAGAGCCCAGTC-
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      ---ATCTAAT--AAAATCA------GGATGGGAATGGGATTATACATTGG
Orobanchaceae-trnL-trnF-aligned.aln:KX524675_Lindenbergia_siniaca      GAATG
Orobanchaceae-trnL-trnF-aligned.fasta:>KX524675_Lindenbergia_siniaca
```

Jeśli chcemy przeszukać pliki w danym katalogu, należy użyć opcji `-r`, np.: `grep -r Lindenbergia SEKWENCJE`.


Narzędzia grep można użyć na przykład do sprawdzenia ile sekwencji znajduje się w pliku `fasta`. W tym celu należy znaleźć i policzyć linie zawierające znak `>`. Tu jednak czyha pewna pułapka. Najbardziej oczywistą komendą wydaje się: `grep > Orobanchaceae-trnL-trnF-aligned.fasta` ale jej wynik będzie taki:

```
$: grep > Orobanchaceae-trnL-trnF-aligned.fasta 
Składnia: grep [OPCJA]... WZORZEC [PLIK] ...
Napisz „grep --help” żeby dowiedzieć się więcej.
```

Po pierwsze polecenie ewidentnie nie zrobiło tego czego po nim oczekiwaliśmy a po drugie jeśli teraz spróbujemy wyświetlić zawartość pliku `Orobanchaceae-trnL-trnF-aligned.fasta` to okaże się, że jest pusty. Dlaczego?

Przypomnijmy sobie, że operator `>` służy do przekazania tekstu do pliku. Zatem polecenie `grep > Orobanchaceae-trnL-trnF-aligned.fasta` uruchomiło polecenie `grep` (z nieprawidłową składnią) a wynik jego działania zapisało w pliku, w którym chcieliśmy szukać znaków `>`, wymazując jego poprzednią zawartość. Jest to bardzo łatwy do popełnienia błąd, który może się skończyć utratą wyników pracy! Jak więc należy prawidłowo wyszukać znaku `>`? Umieszczając go w cudzysłowach:

```
$: grep ">" Orobanchaceae-trnL-trnF-aligned.fasta
>KY484464_O._teucrii
>KY484493_O._flava
>KY484489_O._mayeri
>KY484471_O._kochii
>KY484474_O._elatior
>KU238865_O._coerulescens
>KY484502_P._ramosa
>KY484503_P._purpurea
>KX524675_Lindenbergia_siniaca
```

> Zadanie: Zastanów się, co trzeba zrobić, żeby uzyskać nazwy sekwencji w osobnym pliku?

No dobrze, teraz możemy policzyć wyświetlone linie ale wolelibyśmy, żeby komputer sam je policzył. Co prawda istnieje odpowiednia opcja programu `grep`, która to robi (znajdź ją), ale jest to dobra okazja, żeby pokazać w jaki sposób można połączyć różne polecenia tak aby wykonały razem zadanie.

## Potoki, czyli łączymy polecenia.

Chcemy policzyć linie, w których znajduje się znak `>`. Mamy do dyspozycji jedno narzędzie, które wyszukuje odpowiednie linie (`grep`) i drugie, które liczy linie (`wc`). Trzeba je zatem odpowiednio połączyć w jeden ,,taśmociąg''. Wykorzystamy do tego potoki (ang. _pipe_) - wynik działania `grep` (strumień) zostanie skierowany do `wc`. Do łączenia w ten sposób poleceń służy operator `|`. Polecenia `wc` użyjemy z flagą `-l`, która zwraca liczbę linii.

```
$: grep ">" Orobanchaceae-trnL-trnF-aligned.fasta | wc -l
9
```

Wiemy, że w pliku mamy 9 sekwencji.

Teraz poznamy kolejną opcję `-v`, która pozwala ,,odwrócić'' dopasowanie, czyli zwrócić linie, w których **nie występuje** dopasowanie i połączymy dwa polecenia `grep` tak, aby uzyskać listę próbek, które **nie zawierają** ciągu ,,Lindenbergia'':

```
$: grep -v Lindenbergia Orobanchaceae-trnL-trnF-aligned.fasta | grep ">"
>KY484464_O._teucrii
>KY484493_O._flava
>KY484489_O._mayeri
>KY484471_O._kochii
>KY484474_O._elatior
>KU238865_O._coerulescens
>KY484502_P._ramosa
>KY484503_P._purpurea
```

Jak widać, w drugim wywołaniu plecenia `grep` nie podaliśmy nazwy pliku, tekst do przeanalizowania został przekazany za pomocą potoku.

Wynik możemy przekazać dalej, na przykład do polecenia `sort`, które jak nazwa wskazuje sortuje linie tekstu:

```
$: grep -v Lindenbergia Orobanchaceae-trnL-trnF-aligned.fasta | grep ">" | sort
>KU238865_O._coerulescens
>KY484464_O._teucrii
>KY484471_O._kochii
>KY484474_O._elatior
>KY484489_O._mayeri
>KY484493_O._flava
>KY484502_P._ramosa
>KY484503_P._purpurea
```

Można oczywiście uzyskaną posortowaną listę nazw sekwencji do pliku:

```
$: grep -v Lindenbergia Orobanchaceae-trnL-trnF-aligned.fasta | grep ">" | sort > posortowane.txt
```

Wykonaj powyższe polecenie i sprawdź zawartość pliku `posortowane.txt`.

## `xargs` - przekazanie argumentów do kolejnego polecenia

Narzędzie `xargs` pozwala przekazać kolejnemu poleceniu argumenty otrzymane ze standardowego wejścia, czyli np. przez potok. Najłatwiej pokazać to na przykładzie:

```
ls *.fasta | xargs cat > wszystkie.fasta
```

Najpierw mamy polecenie `ls *fasta`, które zwraca listę plików o przedłużeniu `fasta` znajdujących się w bieżącym katalogu. Jest ona przekazywana przez potok do polecenia `xargs`, które przekazuje je poleceniu `cat` jako kolejne argumenty. Jak wiemy polecenie `cat` zwraca zawartość pliku, którego nazwa jest argumentem do standardowego wyjścia, którym może być ekran, ale w tym przypadku, przekierowujemy ją do pliku `wszystkie.fasta`. Tak więc całe polecenie umieszcza zawartość wszystkich plików `fasta` w pliku wynikowym. W tym przypadku można by było po prostu wykonać komendę:

```
cat *.fasta > wszystkie.fasta
```

ale jak się później przekonamy, nie zawsze tak łatwo jest pominąć `xargs` i program ten bywa bardzo pożyteczny.




## `sed` - przetwarzanie tekstu

Kolejne bardzo użyteczne narzędzie to `sed`. Pozwala na edycję strumienia danych. Jedną z zalet używania tego typu programów jest możliwość uzyskiwania i modyfikacji danych z plików bez konieczności ich otwierania od razu w całości, jak to ma miejsce w edytorach tekstu. Nie mam to wielkiego znaczenia w przypadku niewielkich plików ale na przykład pliki uzyskiwane przy sekwencjonowaniu genomów mogą mieć wielkość wielu gigabajtów co w znacznym stopniu utrudnia pracę nad nimi w edytorach tekstu. Nawet jednak dla małych plików praca z linii komend może być po prostu znacznie szybsza.

Prosty schemat użycia `sed` wygląda tak:

```
sed 's/szukany/zmieniony/g' plik
```

W pliku `plik` zmieniane są wszystkie ciągi znaków `szukany` na `zmieniony`. Bez opcji `g` (po trzecim ukośniku) zmienione zostanie tylko pierwsze wystąpienie szukanego ciągu w linii. Zamiast pliku można użyć strumienia danych z innych poleceń. 
```
$: echo "ATCTTGGATCG" | sed 's/T/U/g'
AUCUUGGAUCG
```

Kilka przykładów, wykorzystamy utworzony powyżej plik `posortowane.txt`, najpierw sprawdźmy co zawiera:

```
$: more posortowane.txt 
>KU238865_O._coerulescens
>KY484464_O._teucrii
>KY484471_O._kochii
>KY484474_O._elatior
>KY484489_O._mayeri
>KY484493_O._flava
>KY484502_P._ramosa
>KY484503_P._purpurea
```

Zamiana znaków '_' na spacje:

```
sed 's/_/ /g' posortowane.txt
>KU238865 O. coerulescens
>KY484464 O. teucrii
>KY484471 O. kochii
>KY484474 O. elatior
>KY484489 O. mayeri
>KY484493 O. flava
>KY484502 P. ramosa
>KY484503 P. purpurea
```

Usuwane znaku `>`, ponieważ występuje on tylko raz w linii, opcja `g` jest zbędna:

```
sed 's/>//' posortowane.txt 
KU238865_O._coerulescens
KY484464_O._teucrii
KY484471_O._kochii
KY484474_O._elatior
KY484489_O._mayeri
KY484493_O._flava
KY484502_P._ramosa
KY484503_P._purpurea
```

Połączmy teraz dwa powyższe i zmieńmy skróty `P.` oraz `O.` na pełne nazwy rodzajowe:

```
$: sed 's/>//' posortowane.txt | sed 's/_/ /g' | sed 's/O\./Orobanche/' | sed 's/P\./Phelipanche/'

KU238865 Orobanche coerulescens
KY484464 Orobanche teucrii
KY484471 Orobanche kochii
KY484474 Orobanche elatior
KY484489 Orobanche mayeri
KY484493 Orobanche flava
KY484502 Phelipanche ramosa
KY484503 Phelipanche purpurea
```

Zauważ, że zamiast napisać `s/O./Orobanche/` napisałem `s/O\./Orobanche/`. Co prawda w tym przypadku oba warianty zwrócą taki sam wynik, ale sposób ich działania jest nieco odmienny, o czym za chwilę.

Wynik działania `sed` często chcemy zapisać w pliku. Można w tym celu użyć znaku `>`:

```
$: sed 's/>//' posortowane.txt | sed 's/_/ /g' | sed 's/O\./Orobanche/' | sed 's/P\./Phelipanche/' > zmieniony.txt
```

Teraz można wykonać polecenie:

```
$: mv zmieniony.txt posortowane.txt
```

Jeśli chcemy bezpośrednio zmienić plik oryginalny, należy użyć opcji -i ale wtedy nie użyjemy potoków, możemy natomiast zgrupować formuły zmian razem oddzielając je średnikami (jeśli to nie działa spróbuj dodać opcję `-e`):

```
sed -i 's/>//;s/_/ /g;s/O\./Orobanche/;s/P\./Phelipanche/' posortowane.txt
```

Można też wykonać kolejno operacje:

```
$: sed -i 's/>//' posortowane.txt
$: sed -i 's/_/ /g' posortowane.txt
$: sed -i 's/O\./Orobanche/' posortowane.txt
$: sed -i 's/P\./Phelipanche/' posortowane.txt
```

Należy uważać ze zmianą oryginalnego pliku, lepiej najpierw sprawdzić czy wpisywana formuła edycji działa prawidłowo a dopiero później użyć opcji `-i`.

## Wyrażenia regularne

Wyrażenia regularne są bardzo użyteczne w bioinformatyce, ponieważ są potężnym narzędziem ułatwiającym pracę z plikami tekstowymi i strumieniami tekstu czy ogólniej z ciągami znaków. Dzięki nim można opisać z różnym stopniem ogólności ciągi znaków, czy ich kategorie aby później je wyświetlić, usunąć czy zmodyfikować. Wykorzystuje się je w takich narzędziach jak `grep`, `sed` i wielu innych z dobrymi edytorami tekstu włącznie (np. `vim`). 

Przyjrzyjmy się ponownie zmodyfikowanemu plikowi `posortowane.txt`. 

```
$: more posortowane.txt 
KU238865 Orobanche coerulescens
KY484464 Orobanche teucrii
KY484471 Orobanche kochii
KY484474 Orobanche elatior
KY484489 Orobanche mayeri
KY484493 Orobanche flava
KY484502 Phelipanche ramosa
KY484503 Phelipanche purpurea
```

Przypuśćmy, że chcemy uzyskać jedynie listę organizmów, bez numerów GenBank-u. Można by je po kolei usuwać, ale znaczne wygodniej będzie użyć wyrażeń regularnych:

```
$: sed 's/^[[:alnum:]]\+[[:space:]]//' posortowane.txt
Orobanche coerulescens
Orobanche teucrii
Orobanche kochii
Orobanche elatior
Orobanche mayeri
Orobanche flava
Phelipanche ramosa
Phelipanche purpurea
```

Zanim wyjaśnię jak i dlaczego to działa, trochę teorii.

W wyrażeniach regularnych możemy stosować znaki rozumiane dosłownie (litery, cyfry, spacje, niektóre inne znaki) oraz znaki specjalne (`$`, `*`, `.`, `[`, `\`, oraz `^`)i wyrażenia, które pozwalają na przykład opisać kategorie znaków, ich liczbę, położenie itp. Na przykład `ATG` oznacza ciąg `ATG` ale `[ATG]` oznacza `A` lub `T` lub `G`. Specjalne znaczenie ma znak `\`, który zmienia znaczenie następnego znaku - na przykład oznacza, że następujący po nim znak specjalny powinien być rozumiany dosłownie albo, że zwykły znak ma znaczenie specjalne. 

W poniższej tabeli znajdują się **niektóre** przykłady:

| **Wyrażenie**  | **Znaczenie** | **Przykład** | **Znaczenie przykładu** |
| :--------: | :-------- | :------: | :------------------ |
| `*`        | zero lub więcej wystąpień wyrażenia | `T*` | zero lub więcej liter `T` | 
| `\+`       | jedno lub więcej wystąpień wyrażenia | `T\+` | jedna lub więcej litera `T` | 
| `\?`       | zero lub jedno wystąpień wyrażenia | `T\?` | zero lub jedna litera `T` | 
| `\{i\}`    | dokładnie `i` wystąpień wyrażenia | `T\{3\} ` | trzy znaki `T`| 
| `\{i,j\}`  | pomiędzy `i` a `j` wystąpień wyrażenia | `T\{3,5\} ` | pomiędzy 3 a 5 znaków `T`| 
| `\{i,\}`   | `i` lub więcej wystąpień wyrażenia | `T\{3,\} ` | przynajmniej 3 znaki `T`| 
| `.`        | jakikolwiek znak | `.\{3\}` | trzy dowolne znaki | 
| `^`        | początek linii | `^T` | znak `T` występujący na początku linii | 
| `$`        | koniec linii | `T$` | znak `T` na końcu linii | 
| `[znaki]`  | jakikolwiek znak z zestawu znaków | `[TGA]` | `T` lub `G` lub `A` | 
| `[x-y]`    | jakikolwiek znak z zakresu x do y (litery, cyfry)| `[A-Z]` | duża litera | 
|            |          | `[a-z 0-9]` | mała litera lub cyfra | |
| `[^znaki]` | jakikolwiek znak z poza zestawu znaków | `[^TGA]` | jakikolwiek znak oprócz `T`, `G` i `A` | 
| `\znak_specjalny` | znak specjalny (`$`, `*`, `.`, `[`, `\`, `^`) rozumiany dosłownie | `\^` | znak `^` (a nie początek linii) | 
| `\(wyrażenie\)` | wyrażenie grupujące,  dopasowany łańcuch można później wykorzystać, np. wstawiając go w inne miejsce | | |
| `\n`       | znak nowej linii |  | | 
| `\t`       | znak tabulatora |  | | 
| `[[:alnum:]]` | znak alfanumeryczny (litery lub cyfry)  |  | | 
| `[[:alpha:]]` | litera | | | 
| `[[:digit:]]` | cyfra | | | 
| `[[:blank:]]` | spacja lub tabulator | | | 
| `[[:space:]]` | znak odstępu (w tym nowej linii) | | | 

Zauważ, że znaczenie znaku `^` zmienia się w zależności od kontekstu - oznacza on początek linii lub negację zakresu znaków.

Wróćmy teraz do pliku `posortowane.txt` i zastanówmy się jak można opisać numery GenBank-u?

```
$: more posortowane.txt 
KU238865 Orobanche coerulescens
KY484464 Orobanche teucrii
KY484471 Orobanche kochii
KY484474 Orobanche elatior
KY484489 Orobanche mayeri
KY484493 Orobanche flava
KY484502 Phelipanche ramosa
KY484503 Phelipanche purpurea
```

Jest to ciąg znaków zaczynający się na początku linii, zawierający litery i cyfry (znali alfanumeryczne) po którym występuje spacja (jeden ze znaków odstępu). 

Teraz poprzednio użyte wyrażenie powinno być bardziej zrozumiałe:

```
$: sed 's/^[[:alnum:]]\+[[:space:]]//' posortowane.txt
```

`^` początek linii `[[:alnum:]]\+` jeden lub więcej znaków alfanumerycznych `[[:space:]]` znak odstępu.

> Zadanie: Spróbuj usunąć numery GenBank-u używając innego wyrażenia.

Po przejrzeniu powyższej tabeli powinno być jasne, dlaczego powyżej zamiast napisać `s/O./Orobanche/` napisałem `s/O\./Orobanche/`. Kropka oznacza jakikolwiek znak, ponieważ także oznacza kropkę oba wyrażenia zadziałają w tym przypadku (!) tak samo, ale jeśli chcemy być pewni, że dopasujemy znak `.`, to powinniśmy użyć przed niem znaku `\`, co spowoduje, że znak zostanie odczytany dosłownie.

Zamieszczone w tabeli wyrażenie `\(wyrażenie\)` zapewne wydaje się niejasne. Pokażę zatem na przykładzie jak może być wykorzystane. Tym razem zadaniem będzie przeniesienie numeru GenBank-u na koniec linii. Można to zrobić tak: 

```
$: sed 's/^\([[:alnum:]]\+[[:space:]]\)\(.*\)/\2 \1/' posortowane.txt
Orobanche coerulescens KU238865 
Orobanche teucrii KY484464 
Orobanche kochii KY484471 
Orobanche elatior KY484474 
Orobanche mayeri KY484489 
Orobanche flava KY484493 
Phelipanche ramosa KY484502 
Phelipanche purpurea KY484503
```

Powyżej wykorzystałem dwa wyrażenia grupujące. Pierwszy z nich obejmuje dopasowanie numeru GenBank-u (oraz spację), drugie pozostałą część tekstu (`.*` oznacza zero lub więcej dowolnych znaków. Po drugim ukośniku odwołuję się do wcześniej znalezionych dopasowań: `\1` oznacza pierwsze dopasowanie, `\2` drugie dopasowanie. Umieszczając je w kolejności `\2 \1` umieściłem pierwsze dopasowanie po drugim. 

Zamianę można ograniczyć do linii, w których znajduje się inne dopasowanie. Na przykład:

```
$: sed "/^>/ s/A/0/g" plik.fasta
```

Zamieni znaki `A` na `0` w liniach, które zaczynają się od `>`.

Z kolei polecenie:

```
$: sed "/^>/! s/A/0/g" plik.fasta
```

Dokona zamiany w liniach, które **nie** rozpoczynają się od `>`.

Jeśli przed `s` w poleceniu umieścimy liczbę, będzie się ono odnosiło do linii w pliku o podanym numerze. Możemy np. w ten sposób dodać tekst w pierwszej linii w pliku `plik.txt`:

```
sed -i "1s/^/Tytuł dzieła\n/" plik.txt
```

Aby usunąć linie, w których znajduje się dany wzorzec stosujemy następującą komendę:

```
sed '/wzorzec/d' plik
```

Na przykład poniższa komenda usunie wszystkie linie z opisami sekwencji z pliku `sekwencje.fasta`

```
sed -i '/^>/d' sekwencje.fasta
```

## `tr` - zmiana i usuwanie znaków

Program `tr` ma podobne zastosowanie do `sed`-a, specjalizuje się jednak w zamianie pojedynczych znaków.

Używamy go w ten sposób:

```
tr opcje znaki1 znaki2
```

`znaki1` - to zestaw znaków które zmieniamy
`znaki2` - to zestaw znaków na które zmieniamy

Pokażę to na kilku przykładach.

Zamiana `*` na `-`

```
$: echo "AGGC*TT" | tr "*" "-"

AGGC-TT
```

Usunięcie znaków `-`. Tak można łatwo usunąć z sekwencji znaki oznaczające indele.

```
$: echo "AG--GC-TT" | tr -d "-"

AGGCTT
```

Zamiana `A` na `T`, `C` na `G`, `G` na `C` oraz `T` na `A`. 
```
$: echo "AGGCTT" | tr "ACGT" "TGCA" 

TCCGAA
```

W ten sposób można otrzymać łatwo sekwencję komplementarną.
Zauważ, że powyższa komenda nie zmienia sekwencji `ACGT` na `TGCA`, ale podmienia poszczególne znaki.

`tr` nie ma możliwości bezpośredniej modyfikacji pliku, dlatego jeśli chcemy zmienić plik, użyjemy znaków przekierowania `<` do pliku wejściowego i `>` dla pliku wyjściowego.

Utwórz plik `sekwencje.txt` o zawartości:

```
CGACCAGATTACGGGGCCCATTA
CGAGACATTTATATACGATATAG
AAATTTCGCGCGCAGATAGCATA
```



Teraz utworzymy dla tych krótkich sekwencji sekwencje komplementarne:

```
tr "ACGT" "TGCA" < sekwencje.txt > sekwencje_komplementarne.txt
```

albo 

```
cat sekwencje.txt | tr "ACGT" "TGCA" > sekwencje_komplementarne.txt
```

Otrzymujemy plik `sekwencje_komplementarne.txt`:

```
GCTGGTCTAATGCCCCGGGTAAT
GCTCTGTAAATATATGCTATATC
TTTAAAGCGCGCGTCTATCGTAT
```

Teraz połączmy te sekwencje w jedną, długą. W tym celu usuniemy `\n` oznaczający znak nowej linii.

```
tr -d "\n" < sekwencje_komplementarne.txt > polaczona_sekwencja_komplementarna.txt
```

 Tu też oczywiście można też użyć komendy `cat` i znaku `|`:

```
cat sekwencje_komplementarne.txt| tr -d "\n" > polaczona_sekwencja_komplementarna.txt
```

Plik wynikowy, zgodnie z założeniem, posiada jedną długą sekwencję:

```
GCTGGTCTAATGCCCCGGGTAATGCTCTGTAAATATATGCTATATCTTTAAAGCGCGCGTCTATCGTAT
```

## `rev` - odwracanie łańcucha znaków

Bardzo prostym, ale użytecznym narzędziem jest `rev` (od _reverse_), który odwraca łańcuch znaków.

```
$: echo "ACGTTT" | rev

TTTGCA
```

Teraz można sekwencję w pliku `polaczona_sekwencja_komplementarna.txt` także odwrócić. W efekcie otrzymamy sekwencję komplementarną, odwróconą.

```
cat polaczona_sekwencja_komplementarna.txt | rev > polaczona_sekwencja_komplementarna_odwrocona.txt
```

Cały proces łączenia przekształcania sekwencji w odwróconą i komplementarną można zmieścić w ,,jednolinijkowcu'' używając potoków i przekierowania: 

```
cat sekwencja.txt | tr "ACGT" "TGCA" | tr -d "\n" | rev > sekwencja_RC.txt
```

## `uniq` - usuwanie powtórzeń

Polecenie `uniq` pozwala na usuwanie powtarzających się linii. Na przykład chcielibyśmy otrzymać listę rodzajów z taksonów znajdujących się w pliku `fasta` ale tak, aby każda nazwa występowała tylko raz. 

Pobierz plik:

```
http://ggoralski.pl/files/filogenetyka-data/atp6-samples.fasta
```

Najpierw uzyskajmy opisy sekwencji:

```
$: grep ">" atp6-samples.fasta 
>KY492922.1 Dendropicos elliotii isolate DA07 ATP6 (ATP6) gene, partial cds; mitochondrial
>KY492921.1 Dendropicos stierlingi isolate ZMUC74329 ATP6 (ATP6) gene, complete cds; mitochondrial
>KY492920.1 Dendropicos poecilolaemus isolate ZMUC72915 ATP6 (ATP6) gene, complete cds; mitochondrial
>KY492919.1 Campethera punctuligera isolate ZMUC56174 ATP6 (ATP6) gene, complete cds; mitochondrial
>KY492918.1 Campethera cailliautii isolate ZMUC56172 ATP6 (ATP6) gene, complete cds; mitochondrial
>KY492917.1 Dendropicos fuscescens isolate Z34 ATP6 (ATP6) gene, complete cds; mitochondrial
>KY492916.1 Campethera cailliautii isolate W45 ATP6 (ATP6) gene, complete cds; mitochondrial
>KY492915.1 Chloropicus xantholophus isolate MNHN2005922 ATP6 (ATP6) gene, complete cds; mitochondrial
....
```

Jak widać opisy są nieco bardziej złożone niż w poprzednio używanym pliku, ponadto jest ich więcej (powyżej widać tylko początek listy).

Teraz trzeba wyodrębnić nazwy rodzajowe. W naszym pliku jest to drugi ciąg znaków alfanumerycznych. Zastanów się jak go uzyskać?

```
$: grep ">" atp6-samples.fasta | sed 's/\(^>[[:alnum:]]\+\.[[:digit:]][[:space:]]\)\([[:alnum:]]\+\)\([[:space:]].\+\)/\2/' 
Dendropicos
Dendropicos
Dendropicos
Campethera
Campethera
Dendropicos
Campethera
Chloropicus
Campethera
Dendropicos
...
```

Tym razem wykorzystałem trzy wyrażenia grupujące: pierwszy oznacza numer GenBank-u (znali alfanumeryczne, kropka, cyfra) ze spacją, drugi znajduje ciąg znaków alfanumerycznych odpowiadających nazwie rodzajowej a trzeci grupuje pozostałe znaki w linii. Jak widać wykorzystujemy w dalszej części polecenia tylko drugie dopasowanie co powoduje, że zwracana jest tylko nazwa rodzajowa.
Szkopuł w tym, że nazwy te wyświetlają się wielokrotnie, a chcielibyśmy mieć listę rodzajów, taką w której każda występowałaby tylko raz. Dodajmy zatem polecenie `uniq`:

```
$: grep ">" atp6-samples.fasta | sed 's/\(^>[[:alnum:]]\+\.[[:digit:]][[:space:]]\)\([[:alnum:]]\+\)\([[:space:]].\+\)/\2/' | uniq
Dendropicos
Campethera
Dendropicos
Campethera
Chloropicus
Campethera
Dendropicos
Campethera
Ipophilus
...
```

Efekt jest nie do końca zgodny z oczekiwaniami. Co prawda duplikaty zostały usunięte, ale tylko wtedy gdy znajdowały się bezpośrednio po sobie. Tak właśnie działa `uniq`. Wykorzystajmy zatem polecenie, które sortuje linie, czyli `sort`  wtedy wszystkie takie same linie znajdą się bezpośrednio przy sobie. 

```
$: grep ">" atp6-samples.fasta | sed 's/\(^>[[:alnum:]]\+\.[[:digit:]][[:space:]]\)\([[:alnum:]]\+\)\([[:space:]].\+\)/\2/' | sort | uniq
Campethera
Chloropicus
Cooperia
Dendropicos
Ipophilus
Paracoccidioides
Pocillopora
```

> Zadanie: policz ile sekwencji i ile różnych nazw rodzajowych znajduje się w pliku

