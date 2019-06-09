FROM node:alpine AS builder

WORKDIR "/app"

COPY package.json .
RUN npm install

COPY . . 
RUN npm run build


FROM nginx:alpine AS run
# Per elasticbeanstalk
EXPOSE 80
# la destinazione e' specifica per il container ngnix
COPY --from=builder /app/build /usr/share/nginx/html/

# ngninx parte di default
