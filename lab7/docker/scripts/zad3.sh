# 3. Połączenie bazy danych z serwisem backendowym

# Utworzenie sieci w dockerze
sudo docker network create backend_network

# Dodanie kontenera z baza danych mongo do sieci
sudo docker network connect backend_network mongo

# Przebudowanie obrazu backend po dodaniu zmiennej srodowiskowej do dockerfile'a
sudo docker build -t backend .

# Usuniecie istniejacego kontenera backend
sudo docker stop backend
sudo docker rm backend

# Utworzenie kontenera backend, dodajac go do utworzonej sieci
sudo docker run --detach --name backend --network backend_network --publish 8000:8000 backend

