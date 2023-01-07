FROM node:16.18.1-alpine3.15

WORKDIR /app
COPY package*.json /app/

RUN npm install

COPY . /app/

EXPOSE 3000

CMD [ "npm", "run", "start" ]


# docker build -t ubay/belajar-docker .
# docker run -d -p 3000:3000 ubay/belajar-docker

# docker image ls
# docker container ls
# docker container stop id container
# docker container start id container
# docker container rm id container
# docker image rm id image