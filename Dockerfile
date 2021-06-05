FROM node:16-alpine3.11
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
#copy /app/build from above builder phase and move it to shareable folder (visit nginx docker-hub for more)
COPY --from=0 /app/build /usr/share/nginx/html