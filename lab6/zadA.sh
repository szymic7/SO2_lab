#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 7
#
# Celem zajęć jest zapoznanie się z wyrażeniami regularnymi, wykorzystując
# przy tym narzędzia awk i grep oraz wszystkie inne, poznane na zajęciach.
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
# Zadanie 10.
# Proszę opracować uproszczony konwerter plików z formatu JSON do formatu XML
# i przetworzyć nim plik `dodatkowe/simple.json`. Zakładamy, że wejście stanowi
# zawsze pojedyncza linia, klucze i wartości to proste łańcuchy znaków, złożone
# z liter lub cyfr, pomiędzy cudzysłowami, które są rozdzielone jednym znakiem
# dwukropka i co najmniej jedną spacją, a całe pary klucz-wartość są oddzielone
# od siebie jednym przecinkiem i co najmniej jedną spacją.
#
# Przykład przetworzenia: {"klucz": "wartość"} -> <klucz>wartość</klucz>.
#
# Proszę obsłużyć tworzenie samodomykającego się znacznika (<klucz />), kiedy
# wartość stanowi pusty łańcuch "", a także proszę obsłużyć zagnieżdżenie
# kolejnego zbioru kluczy i wartości.
#

json_file="dodatkowe/simple.json"
json=$(<"$json_file")

# Usuwamy zewnętrzne nawiasy klamrowe
json="${json#\{}"
json="${json%\}}"

json_to_xml() {
    local input="$1"  # pierwszy argument funkcji = wejsciowy JSON

    while [[ -n "$input" ]]; do  # input nie jest pusty
        # Usuwamy wszyskie spacje i przecinki z początku
        input="${input#"${input%%[![:space:],]*}"}"

        # Przypadek 1.: "klucz": "wartość"
        if [[ "$input" =~ ^\"([a-zA-Z0-9]+)\"[[:space:]]*:[[:space:]]*\"([a-zA-Z0-9ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]*)\" ]]; then
            key="${BASH_REMATCH[1]}"  # zapisanie pierwszej dopasowanej grupy - klucz
            val="${BASH_REMATCH[2]}"  # zapisanie drugiej dopasowanej grupy - wartość
            if [[ -z "$val" ]]; then  # wartosc pusta
                printf "<$key />"
            else  # wartosc niepusta
                printf "<$key>$val</$key>"
            fi
            input="${input:${#BASH_REMATCH[0]}}"  # usuwamy przetworzonego fragmentu z inputu

        # Przypadek 2.: "klucz": { (zagniezdzony obiekt) }
        elif [[ "$input" =~ ^\"([a-zA-Z0-9]+)\"[[:space:]]*:[[:space:]]*\{ ]]; then
            key="${BASH_REMATCH[1]}"  # dopasowany klucz
            input="${input#*\"$key\":}"     # usuwamy wszystko do "klucz": (włącznie)
            input="${input#"${input%%[![:space:]]*}"}"  # usuwamy spacje przed zagnieżdżonym obiektem
            input="${input#\{}"  # usuwamy początkowy nawias klamrowy {

            # Wyciagniecie zagniezdzonego obiektu
            braces=1  # licznik nawiasów klamrowych (poziomow zagnieżdzenia)
            nested=""
            i=0
            while [[ $braces -gt 0 && $i -lt ${#input} ]]; do  # braces > 0 && i < len(input)
                char="${input:$i:1}"  # znak spod indeksu i
                if [[ "$char" == "{" ]]; then ((braces++)); fi
                if [[ "$char" == "}" ]]; then ((braces--)); fi
                nested+="$char"
                ((i++))
            done
            nested="${nested::-1}"  # usuwamy koncowy nawias }
            printf "<$key>"  # otwieramy znacznik XML dla klucza
            closing="$key"  # zapamiętujemy klucz do zamknięcia znacznika
            json_to_xml "$nested"  # rekurencyjne wywołanie funkcji dla zagniezdzonego obiektu
            printf "</$closing>"

            input="${input:$i}"  # przesuwamy za zagniezdzony obiekt
        else
            break
        fi
    done
}

json_to_xml "$json"
echo
