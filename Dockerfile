FROM node:10.24.1-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#copy /app/build from above builder phase and move it to shareable folder (visit nginx docker-hub for more)
COPY --from=builder /app/build /usr/share/nginx/html