FROM node:14.4.0-alpine3.10 as builder

WORKDIR '/apps'

COPY package.json .
RUN npm install

COPY . .

CMD ["yarn", "build"]

FROM nginx
COPY --from=builder /apps/build /usr/share/nginx/html
