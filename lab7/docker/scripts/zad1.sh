# 1. Uruchom kontener z bazą danych mongo

# Pobranie obrazu z dockerhub.com
sudo docker pull mongo

# Uruchomienie kontenera jako podproces
# Wersja 4.4 mongo nie wymaga procesora z obsluga instrukcji AVX (dziala na maszynie wirtualnej)
sudo docker run --detach --name mongo --publish 27017:27017 mongo:4.4

# Wyswietlenie logow
sudo docker logs mongo

