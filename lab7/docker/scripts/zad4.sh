# 4. Dodawanie wolumenów

# Utworzenie wolumenu
sudo docker volume create mongo_volume

# Usuniecie kontenera mongo
sudo docker stop mongo
sudo docker rm mongo

# Uruchomienie kontenera mongo, podlaczajac wolumen
sudo docker run -d --name mongo --network backend_network -p 27017:27017 \
 --volume mongo_volume:/data/db mongo:4.4

# Dodatkowo, konieczna byla modyfikacja dwoch plikow projektu, 
# aby umozliwic poprawne dzialanie endopintow:
# * database_models.py - umozliwienie polaczenia z kontenerem mongo,
#   z uzyciem dodanej w zad. 3 zmiennej srodowiskowej DATABASE_URL
# * .config - usuniecie "" z nazwy stosowanego algorytmu

