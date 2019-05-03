# Warsztat pracy

Praca bioinformatyczna wymaga dobrej organizacji, a także dokumentacji prowadzonych badań. Warto przy tym trzymać się pewnych schematów i zasad. 
Poniżej przedstawię kilka sugestii opartych na własnych doświadczeniach a także bardzo dobrej książce [Bioinformatics Data Skills](http://shop.oreilly.com/product/0636920030157.do)
 autorstwa Vince Bufallo, która zajmuje się między innymi warsztatowymi aspektami pracy bioinformatycznej. Oczywiście nie trzeba się ich sztywno trzymać a raczej traktować je jako wskazówki, które pozwolą wypracować własny, przystosowany do osobistych upodobań warsztat pracy.


## Badania powinny być powtarzalne 

Sposób pracy powinien być taki aby można było ją odtworzyć od początku do końca, co zresztą jest uniwersalnym zaleceniem do (prawie) każdej pracy naukowej. Z jednej strony chodzi o to by mogli to zrobić inni badacze ale znacznie częściej to my będziemy je powtarzać (i to wielokrotnie) na przykład w przypadku uzyskania nowych danych czy wykrycia błędów w analizie.  Dwa podstawowe aspekty powtarzalności badań to zachowywanie danych i dokumentacja pracy.

## Pliki i katalogi

Kluczową sprawą dobrej organizacji pracy jest porządek w katalogach i plikach. Dobrze jest ustalić sobie pewien standardowy układ katalogów a co za tym idzie miejsc przechowywania plików o konkretnym przeznaczeniu. Całość badań nad danym tematem dobrze jest trzymać w jednym głównym dla projektu katalogu, o nazwie wskazującej na temat, a w nim utworzyć szereg katalogów i podkatalogów.  Oddzielnie należy przechowywać surowe dane, skrypty, dokumentację badań i inne informacje a jeszcze gdzie indziej wyniki badań. 
 
Na przykład taki schemat może wyglądać tak:

```
Katalog_glowny 
├── DANE
├── DANE-SUROWE
├── INFORMACJE
├── README.md (plik)
├── SKRYPTY
└── WYNIKI
```

  * `Katalog_glowny` - Główny katalog obejmujący dany projekt. Nazwa powinna wskazywać na jego temat, np. `Filogenetka_Rumex`
  * `DANE` - Tu możemy trzymać dane nad którymi pracujemy, na różnych etapach ich obróbki.
  * `DANE-SUROWE` - Miejsce przechowywania danych surowych, od których zaczynamy pracę. Traktujemy je jako nienaruszalne, nie modyfikujemy ich w żaden sposób. Pozwala to zawsze zacząć analizy od początku.
  * `INFORMACJE` - Różne dodatkowe informacje potrzebne przy pracy, np. publikacje, instrukcje, wskazówki współpracowników, tabele itp.
  * `README.md` - Plik, w którym notujemy przebieg prac (dalej więcej na ten temat)
  * `SKRYPTY` - Jak nazwa wskazuje, jest to miejsce przechowywania skryptów.
  * `WYNIKI` - Katalog w którym będą znajdować się podkatalogi z wynikami prac. Każda analiza w oddzielnym katalogu (zob.dalej).

Zauważ, że całość można przygotować za pomocą dwu komend:

```
mkdir -p Katalog_glowny/{DANE-SUROWE,DANE,INFORMACJE,SKRYPTY,WYNIKI}
touch Katalog_glowny/README.md
```

## Dokumentacja prac

Jak wspomniałem powyżej, należy dokumentować poszczególne etapy pracy z danymi, w taki sposób aby móc je powtórzyć, kiedy zajdzie potrzeba. Czyli prowadzić bioinformatyczną wersję dziennika laboratoryjnego.  Wymaga to zapisywania wszelkich czynności, które wykonujemy z danymi. Część z nich wykonujemy ręcznie, inne używając programów komputerowych. Tutaj widać kolejną przewagę narzędzi obsługiwanych z linii komend. Znacznie łatwiej zapisać polecenie, które uruchomiliśmy w terminalu wraz z parametrami niż opisywać stosowane ustawienia w ,,klikanej'' aplikacji. Oczywiście łatwiej jest dokumentować pracę na komputerze używając plików, m. in. dzięki możliwości kopiowania i wklejania poleceń, niż zapisywać je w papierowym dzienniku. 

Ze względu na uniwersalność plików tekstowych, dobrze jest używać ich także przy prowadzeniu dokumentacji. ,,Goły'' tekst niekoniecznie jednak jest przejrzysty, zwłaszcza gdy chcemy go podzielić na sekcje, odpowiadające np. poszczególnym dniom pracy albo wyróżnić polecenia w terminalu. Dlatego dobrze jest użyć usystematyzowanego zestawu znaczników, który pozwala na formatowanie tekstu, przy zachowaniu jednak tekstowego charakteru pliku. Do najpopularniejszych należy [Markdown](https://pl.wikipedia.org/wiki/Markdown). Stosując określone znaki lub ich zestawy, można oznaczać m. in. nagłówki, listy, linki, pogrubienia,  fragmenty kodu itp. 

Przykładowe znaczniki to:

Nagłówki:

```
# Nagłówek 1
## Nagłówek 2
### Nagłówek 3
```

Lista:
```
  * pozycja 1
  * pozycja 2
  * pozycja 3
```

Zamiast gwiazdki można używać znaków - lub +

Lista numerowana:
```
1. Pierwszy punkt
2. Drugi punkt
3. Trzeci punkt
```

Linki:
```
[Tekst linku](Adres)
```

Obrazek:
```
![Podps obrazka](ścieżka do obrazka)
```

Kod:
 kod w linii 

```
tekst `kod` tekst
```

lub:

`````
```
 kod 
 kod 
 kod
```
`````

Pogrubienie
```
**pogrubiony tekst**
```

Italik:
```
_Pochylony tekst_
```

Wiecej znaczników i przykładów można znaleźć w internecie na przykład [tu](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).
Format markdown jest dość czytelny ale można go również łatwo przeformatować w `.html` i wiele innych formatów włączając w to `.doc` czy `.pdf`. Do konwersji można wykorzystać na przykład narzędzie [Pandoc](https://pandoc.org/), choć niektóre serwisy (np. GitLab, GitHub, GitBook) automatycznie dokonują przekształcenia plików na format `html` i wyświetlają je jak zwykłe strony internetowe z odpowiedim formatowaniem. Przykładem jest niniejszy skrypt, który został napisany właśnie w markdownie. 

Pliki w formacie markdown zwykle mają nazwy z przedłużeniem `.md`. Stąd takie przedłużenie w nazwie pliku `README.md`. Czemu jednak `README`? Wrócę do tego przy omawianiu narzędzia `Git`.

Jak wspomniałem, w naszym ,,dzienniku'' zapisujemy polecenia, które wydajemy przy pracy z danymi. Aby uniknąć pomyłki i zaoszczędzić czas lepiej to robić przez kopiowanie i wklejanie między edytorem tekstu i terminalem. Przy czym w zależności od sytuacji czasem wygodnie jest wydawać polecenia w terminalu i kopiować je do edytora, w innych przypadkach, zwłaszcza gdy wydajemy serię poleceń, możemy najpierw je wyedytować w naszym ,,dzienniku'' a potem przekopiować całość do terminala i uruchomić. Oczywiście w przypadku powtarzalnych sekwencji poleceń warto rozważyć zapisanie ich do osobnego skryptu (który też należy zachować).

## Zapisywanie wyników

W katalogu `WYNIKI` należy zapisywać rezultaty badań, zwykle generowane przez polecenia i skrypty. Każdy katalog może odpowiadać np. jednemu ciągowi operacji wykonywanemu w danym dniu, lub przez pojedyncze uruchmieniu skryptu czy serii poleceń. Oprócz plików z wynikami, można tam takze umieścić pliki z danymi wejściowymi, zwłaszcza jeśli nie są zbyt duże. Nazwa takiego katalogu powinna objaśniać czego badania dotyczą, dobrze jest jeśli przy tym zawiera datę i czas.  Można to oczywiście zautomatyzować dzięki odpowiednim poleceniom.

Na przykład sprawdź wynik działania komend:

```
sekwencja=atp6
res="$sekwencja-$(date +\%F_\%H-\%M-\%S)"
mkdir $res
```

Tego typu polecenia być standardowym fragmentem skryptu generującego wyniki badań.

Przy okazji sprawdź manual polecenia `date`.


## Kontrola wersji (Git)

Git to jeden z systemu kontroli wersji. Nie wchodząc w szczegóły, oznacza to, że można dzięki niemu zachowywać historię zmian projektu i w razie potrzeby przywracać starsze wersje. Umożliwia także pracę wielu osób nad jednym projektem, umiejętnie łącząc zmiany dokonywane przez wiele osób. Wykorzystuje się go głównie przy tworzeniu programowania, ale doskonale także sprawdza się przy archiwizowaniu pracy bioinformatycznej czy... pisaniu skryptu do kursu filogenetyki. 

Nauka Git-a wykracza poza zakres tego kursu, dlatego tylko przedstawię bardzo podstawowe informacje. Zachęcam jednak do samodzielnego zgłębiania tematu.

Jednym z możliwych scenariuszy jest stworzenie konta na jednym z serwisów, które oferują taką możliwość (np. GitHub, BitBucket, GitLab) a następnie utworzenie projektów i ich synchronizacja z lokalnymi katalogami, które im odpowiadają.

Jeśli chcesz spróbować, utwórz konto na stronie [gitlab.com](https://gitlab.com/), zaloguj się i kliknij na ,,New project''. Pokaże się strona na której nadajesz nazwę swojemu projektowi i dostosowujesz inne parametry, na przykład to czy projekt jest dostępny publicznie czy nie.

Po zatwierdzeniu pojawia się strona na której znajdziesz dalsze instrukcje w jaki sposób skonfigurować `git`-a u siebie (najpierw oczywiście musisz go zainstalować):

```
git config --global user.name "Imie"
git config --global user.email "Twoj@email"
```

i jak utworzyć repozytorium projektu na swoim komputerze:

```
git clone git@gitlab.com:twoje_konto/nazwa_projektu.git
cd probny-projekt
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

Zauważ, że najpierw ,,sklonowałeś'' projekt na swój komputer a potem utworzyłeś w nim plik o nazwie `README.md`. Brzmi znajomo? Plik o takiej nazwie domyślnie zostaje wyświetlony, jako strona internetowa na stronie Twojego projektu. Na końcu zmiany zostały wysłane w trzech krokach na serwer. 

Teraz spróbuj coś dopisać do tego pliku, używając formatowania markdown. Następnie wykonaj w głównym katalogu projektu komendy aktualizujące go na serwerze:

```
git add -A
git commit -a -m "Modyfikacja pliku README.md"
git push 
```

Ten zestaw komend wykonuj po zakończeniu dnia lub etapu pracy. Oczywiście komentarz w cudzysłowach dostosuj tak aby opisywały wykonane zmiany w projekcie.

Teraz obejrzyj na swoim koncie stronę utworzonego projektu.

Projekt można sklonować na innych komputerach i także na nich prowadzić badania. Nie zapominaj tylko aby po skończonej pracy dokonać ,,commitu'' projektu i przed rozpoczęciem kontynuacji pracy wykonać w katalogu głównym projektu komendę:

```
git pull
```

Pobiera ona zmiany z serwera do lokalnego katalogu.
