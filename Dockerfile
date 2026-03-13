FROM node:20
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
# These files must be in the root of your project for this to work
EXPOSE 8443
CMD [ "node", "bin/www" ]