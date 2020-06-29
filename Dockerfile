FROM node:14.4.0-alpine3.10 as builder

WORKDIR '/apps'

COPY package*.json ./
RUN npm install

COPY . .

CMD ["yarn", "build"]

FROM nginx
EXPOSE 80
COPY --from=0 /apps/build /usr/share/nginx/html
