FROM node:alpine AS development
WORKDIR /usr/src/app
COPY package*.json ./
COPY yarn.lock ./ 
RUN yarn install --frozen-lockfile
COPY . .
RUN yarn run build
## stage 2
FROM node:alpine AS production
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /usr/src/app
COPY package*.json ./
COPY yarn.lock ./
RUN yarn install --frozen-lockfile --production
COPY --from=development /usr/src/app/dist ./dist
CMD ["node", "dist/main"]