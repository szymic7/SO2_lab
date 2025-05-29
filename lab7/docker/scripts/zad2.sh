# 2. Stwórz dockefile'a dla backendu

# Zbudowanie obrazu z wykorzystaniem utworzonego dockerfile'a
sudo docker build --tag backend .

# Uruchomienie kontenera z obrazu 'backend'
sudo docker run --detach --name backend --publish 8000:8000 backend

# Sprawdzenie logow kontenera backend
sudo docker logs backend

