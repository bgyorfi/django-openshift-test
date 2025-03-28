# Alap Python 3.9 slim image
FROM python:3.9-slim

# A szükséges csomagok telepítése a psycopg2-höz (PostgreSQL fejlesztői eszközök)
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Munkakönyvtár beállítása
WORKDIR /app

# Requirements fájl másolása
COPY requirements.txt /app/

# Pip frissítése
RUN pip install --upgrade pip

# A függőségek telepítése
RUN pip install --no-cache-dir -r requirements.txt

# Az alkalmazás fájljainak másolása
COPY . /app/

# Az alkalmazás indítása
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
