#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 4
#
# Celem zajęć jest nabranie doświadczenia w pracy z programem `find`,
# wykorzystując przy tym wiedzę na temat struktury systemu plików itd.
# Większość rozwiązań powinno sprowadzić się do jednego, zmyślnego
# wywołania programu `find` z odpowiednimi argumentami.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie.
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#
# Punkt startowy powinien stanowić katalog ze źródłami: linux-5.11.13/
#

#
# Zadanie 6.
# Odszukać wszystkie pliki, których rozmiar jest mniejszy od 1 kiB (kibibajta),
# ale jednocześnie tylko ich bezpośredni właściciel (użytkownik) może zmienić
# ich zawartość. Podać ile dokładnie jest takich plików (zwrócić wyłącznie
# liczbę plików).
#

find linux-5.11.13/ -size -1024c -perm -u=w ! -perm -g=w ! -perm -o=w | wc -l

# '-' przed maska w perm => bity zawarte w masce musza sie zgadzac, a pozostale (x i r) nie sa sprawdzane 
