# aws 서버에서 이거 도커 빌드하는데 왜 오류가 ㅠㅠ
FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .

# install project dependencies
RUN yarn install

# build app for production with minification
RUN yarn run build

EXPOSE 8500
ENTRYPOINT [ "http-server", "-p", "8500", "/app/dist" ]