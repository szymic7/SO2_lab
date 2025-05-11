#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
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
# Zadanie 10.
# Proszę określić, ile w katalogu `dane/icao/` jest unikalnych plików,
# rozumianych jako niepowtarzalne zaalokowanie zawartości na dysku twardym
# (to znaczy: kilka dowiązań twardych do tego samego pliku traktujemy jako 1).
# Jako wynik wyświetlić po prostu samą liczbę, nic więcej.
#

if [ -d dane/icao ]; then
    ls -li dane/icao | awk 'NF > 2 {print $1}' | sort -u | wc -l
fi

# ls -li - wyswietlenie plikow w dlugim formacie, wraz z numerami inode
# awk - narzedzie do przetwarzania i formatowania tekstu
# NF > 2 - wyswietlone zostaja wiersze, posiadajce wiecej niz 2 kolumny (bez wiersza total 64)
# {print $1} - wyswietlenie pierwszej kolumny (inode)
# sort -u - sortowanie unikalnych wartosci
# wc -l - zliczenie wierszy
