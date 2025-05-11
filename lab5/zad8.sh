#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 5
#
# Celem zajęć jest nabranie doświadczenia w pracy z mechanizmem łącz
# nienazwanych, wykorzystując przy tym szereg podstawowych narzędzi
# do przetwarzania danych tekstowych.
#
# Tradycyjnie nie przywiązujemy zbyt dużej wagi do środowiska roboczego.
# Zakładamy, że format i układ danych w podanych plikach nie ulega zmianie,
# ale same wartości, inne niż podane wprost w treści zadań, mogą ulec zmianie,
# a przygotowane zadania wciąż powinny działać poprawnie (robić to, co trzeba).
#
# Wszystkie chwyty dozwolone, ale w wyniku ma powstać tylko to, o czym jest
# mowa w treści zadania – nie generujemy żadnych dodatkowych plików pośrednich.
#

#
# Zadanie 8.
# W ilu plikach źródłowych pakietu coreutils występuje linia, której jedyną
# zawartością jest `#include <stdio.h>` (i nic poza tym w ramach tej linii).
# Jako wynik proszę zwrócić tylko i wyłącznie liczbę odpowiednich plików.
# Źródła znajdują się w katalogu `coreutils-8.32`.
#

find 'coreutils-8.32' -type f | xargs grep --files-with-matches '^#include <stdio.h>$' | wc --lines

# xargs -> pozwala na przekazywanie argumentow (ze standardowego inputu) do polecenia

# --files-with-matches -> wypisujemy nazwy plikow (basename), ktore zawieraja pattern
# ^ -> poczatek linii
# $ -> koniec linii (wyrazenia regularne)
