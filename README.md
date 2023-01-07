```Dockerfile
FROM node:16.18.1-alpine3.15

WORKDIR /app
COPY package\*.json /app/

RUN npm install

COPY . /app/

EXPOSE 3000

CMD [ "npm", "run", "start" ]
```

- docker build -t ubay/belajar-docker . -> build image
- docker run -d -p 3000:3000 ubay/belajar-docker -> build container
- docker image ls -> list image
- docker container ls -> list container
- docker container stop id container -> stop container
- docker container start id container -> start container
- docker container rm id container -> hapus container
- docker image rm id image -> hapus image
