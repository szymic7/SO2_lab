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
# Zadanie 8.
# Przetworzyć zawartość pliku `dodatkowe/sensors.txt` i wyświetlić całą jego
# zawartość, ale podmieniając w locie zapisane tam wartości temperatur ze skali
# Celsjusza na Fahrenheita: T[°F] = T[°C] * 9/5 + 32.
#

awk '
function c_to_f(c) {
    return c * 9 / 5 + 32
}

{
    while (match($0, /[-+]?[0-9]+(\.[0-9]+)?°C/)) {
        temp_c = substr($0, RSTART, RLENGTH - 2)  # usuwamy °C
        temp_f_val = c_to_f(temp_c)
        sign = (temp_f_val >= 0) ? "+" : "" # '+' przed dodatnimi wartościami
        temp_f = sprintf("%s%.1f°F", sign, temp_f_val)
        $0 = substr($0, 1, RSTART - 1) temp_f substr($0, RSTART + RLENGTH)
    }
    print
}
' dodatkowe/sensors.txt