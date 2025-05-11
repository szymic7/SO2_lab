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
# Zadanie 10.
# W katalogu `dane/deep/` i wszystkich jego podkatalogach odnaleźć wszystkie
# pliki zwykłe, których nie możemy przeczytać ze względu na brak uprawnień
# dostępu. Zwrócić ścieżki do odnalezionych plików względem katalogu `dane/`.
# Opracowany skrypt powinien działać niezależnie od istniejącej liczby
# i poziomów podkatalogów.
#
# Wskazówka: pomocne może być zdefiniowanie funkcji i jej rekurencje wywołanie.
#

shopt -s dotglob # modyfikacja zachowania '*', aby wyszukiwane byly takze ukryte pliki

if [ -d dane/deep ]; then

    function find_unreadable() { # definicja funkcji do rekurencyjnego przeszukiwania katalogow
        local directory="${1}" # odczytanie pierwszego argumentu funkcji
        for file in "${directory}"/*; do
            if [ -f "${file}" ] && [ ! -r "${file}" ]; then
                echo "${file#dane/}"
            elif [ -d "${file}" ]; then # podkatalog aktualnego folderu
                find_unreadable "${file}" # rekurencyjne wywołanie funkcji
            fi
        done
    }

    find_unreadable dane/deep
    
fi