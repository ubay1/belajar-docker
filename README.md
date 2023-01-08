```Dockerfile
# 1. karna project kita menggunakan express, maka image harus nodejs
FROM node:16.18.1-alpine3.15

# 2. membuat folder app, yang akan digunakan untuk menyimpan aplikasi kita
WORKDIR /app

# 3. copy package.json & pacakge-lock.json ke container,
COPY package\*.json ./

# 4. jalankan npm install
RUN npm install

# 5. copy semua file ke container, kecuali yang di gitignore
COPY . ./

# 6. karna aplikasi express kita berjalan di port 3000, maka kita expose di dockernya 3000
EXPOSE 3000

# membuat env di dockerfile kita bisa gunakan ENV
# ARG BASE_URL="https://ubay182.vercel.app"
# ENV BASE_URL=${BASE_URL}

# 7. jalankan command npm run start
CMD [ "npm", "run", "start" ]
```

- docker build -t ubay/belajar-docker . -> build image
- docker run -d -p 3000:3000 ubay/belajar-docker -> build container
- docker image ls -> list image
- docker container ls -> list container
- docker container stop id container -> stop container
- docker container start id container -> start container
- docker container rm id container -> hapus container dengan id tertentu
- docker container rm $(docker container ls -q) -> hapus semua container
- docker image rm id image -> hapus image dengan id tertentu
- docker image rm $(docker image ls -q) -> hapus semua image
- docker container prune -> untuk hapus container yang none:none
- docker image prune -> untuk hapus image yang none:none

# Docker Compose

> jika kita menggunakan docker compose, kita tidak perlu lagi CMD pada dockerfile, karna kita akan menjalankannya di docker-compose

- docker compose up -> untuk watching
- docker compose start -> untuk start docker
- docker compose down -> untuk menghancurkan container
- docker compose stop -> untuk stop container
- docker exec -it nama_container -> untuk masuk ke docker

```yml
version: "3.8"
services:
  app:
    container_name: "belajar_docker_compose"
    build: . # akan mencari dockerfile, dan akan membuild berdasarkan isi didalamnya,jika nama dockernya misal Dockerfile.dev, kita bisa tuliskan Dockerfile.dev
    volumes:
      - .:/app
      - node_modules:/app/node_modules
    ports:
      - 3000:3000
    environment:
      - BASE_URL=https://ubay182.vercel.app
    command: npm run start
volumes:
  node_modules:
```

## contoh docker-compose frontend dan backend dalam 1 file

```yml
version: "3.8"
services:
  web:
    build: ./frontend
    ports:
      - 3000:3000
    environment:
      DB_URL: mongodb://db/vidly
  api:
    build: ./backend
    ports:
      - 3001:3001
  db:
    image: mongo:4.0-xenial
    ports:
      - 27017:27017
    volumes:
      - vidly:/data/db
volumes:
  vidly:
```
