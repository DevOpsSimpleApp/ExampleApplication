# syntax=docker/dockerfile:1
FROM node:20

# Set environment to production
ENV NODE_ENV=production

# Create app directory
WORKDIR /usr/src/app

# Copy dependency files
COPY ["package.json", "package-lock.json*", "./"]

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the HTTPS port
EXPOSE 8443

# Start the application using the same command as before
CMD [ "node", "bin/www" ]