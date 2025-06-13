# Uzycie obrazu bazowego z pythonem 3.10
FROM python:3.10-slim

# Ustawinie katalogu roboczego w kontenerze
WORKDIR /app

# Skopiowanie plikow projektu do katalogu roboczego
COPY . .

# Instalacja zaleznosci
RUN pip install --no-cache-dir -r requirements.txt

# Zmienna srodowiskowa ze stringiem polaczeniowym
ENV DATABASE_URL=mongodb://mongo:27017

# Otworzenie portu 8000
EXPOSE 8000

# Domyslna komenda uruchamiajaca aplikacje
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

