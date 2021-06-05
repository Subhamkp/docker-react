FROM node:10.24.1-alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
#copy /app/build from above builder phase and move it to shareable folder (visit nginx docker-hub for more)
COPY --from=0 /app/build /usr/share/nginx/html