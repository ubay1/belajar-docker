FROM node:16.18.1-alpine3.15

WORKDIR /app
COPY package*.json ./

RUN npm install

COPY . ./

EXPOSE 3000

# dicomment karna sudah tidak digunakan, kita gunakan di docker-compose.yml
# ARG BASE_URL="https://ubay182.vercel.app"
# ENV BASE_URL=${BASE_URL}

# dicomment karna sudah tidak digunakan, kita gunakan di docker-compose.yml
# CMD [ "npm", "run", "start" ]


# docker build -t ubay/belajar-docker .
# docker run -d -p 3000:3000 ubay/belajar-docker

# docker image ls
# docker container ls
# docker container stop id container
# docker container start id container
# docker container rm id container
# docker image rm id image
# docker container prune -> untuk hapus container yang <none:none>
# docker image prune -> untuk hapus image yang <none:none>