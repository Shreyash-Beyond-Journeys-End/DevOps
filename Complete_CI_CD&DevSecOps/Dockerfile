FROM node:20-alpine

# pull in the latest Alpine security patches (openssl etc.) on top of the base image
RUN apk upgrade --no-cache

WORKDIR /app

COPY package*.json ./
# npm is only needed to install deps. Removing it afterwards keeps its bundled
# libraries (e.g. node-tar) out of the final image, which the image scan flags.
RUN npm install --omit=dev \
 && npm cache clean --force \
 && rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx

COPY src ./src

# do not run as root
USER node

EXPOSE 3000

CMD ["node", "src/index.js"]
