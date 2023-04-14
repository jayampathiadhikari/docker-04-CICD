# Build Phase

FROM node:16-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build has all the required files

# RUN Phase

FROM nginx
# expose 
EXPOSE 80
# copy from another phase
COPY --from=builder /app/build /usr/share/nginx/html
# no need for start command in nginx

