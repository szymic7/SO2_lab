#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 2
#
# Celem zajęć jest nabranie doświadczenia w podstawowej pracy z powłoką Bash,
# w szczególności w nawigowaniu po drzewie katalogów i sprawdzaniu uprawnień.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 3.
# Zweryfikować istnienie i zawartość pliku `trzeci` z katalogu `dane/`.
# Plik powinien zawierać napis `Ala ma kota.`. Jeśli tak jest, wyświetlić `ok`.
# Jeśli czegoś brakuje to wyświetlić `nok`.
#

if [ -e dane/trzeci ]; then # plik istnieje
    if [ "$(cat dane/trzeci)" = 'Ala ma kota.' ]; then # zawartosc pliku sie zgadza
        echo 'ok'
    else # zawartosc pliku sie nie zgadza
        echo 'nok'
    fi
else # plik nie istnieje
    echo 'nok'
fi