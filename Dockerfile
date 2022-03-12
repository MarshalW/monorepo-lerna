FROM node:16-alpine3.15 as base

WORKDIR /usr/src/app
COPY ./package.json ./
RUN npm install
COPY ./lerna.json ./
COPY ./tsconfig.json ./

# simple-nlp
FROM base as mw-simple-nlp-build
WORKDIR /usr/src/app/packages/simple-nlp
COPY  packages/simple-nlp/package.json ./
WORKDIR /usr/src/app
RUN npx lerna bootstrap --scope=mw-simple-nlp --includeDependencies
WORKDIR /usr/src/app/packages/simple-nlp
COPY packages/simple-nlp/src ./src
COPY packages/simple-nlp/tsconfig.json ./
RUN npm run build

# simple-service
FROM base as mw-simple-service-build
WORKDIR /usr/src/app/packages/simple-service
COPY  packages/simple-service/package.json ./
WORKDIR /usr/src/app
RUN npx lerna bootstrap --scope=mw-simple-service --includeDependencies
WORKDIR /usr/src/app/packages/simple-service
COPY packages/simple-service/src ./src
COPY packages/simple-service/tsconfig.json ./
RUN npm run build

# final stage
FROM base
COPY --from=mw-simple-nlp-build /usr/src/app/packages/simple-nlp /usr/src/app/packages/simple-nlp
COPY --from=mw-simple-service-build /usr/src/app/packages/simple-service /usr/src/app/packages/simple-service

WORKDIR /usr/src/app

EXPOSE 3000

CMD [ "node", "packages/simple-service/lib/index.js" ]