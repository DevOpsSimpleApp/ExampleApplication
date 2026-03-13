#!/usr/bin/env bash

# 1. Update system and ensure Node.js/NPM are installed
sudo apt update && sudo apt install -y nodejs npm

# 2. Install/Update PM2 globally
sudo npm install -g pm2

# 3. Stop the current instance (ignore error if it's not running yet)
pm2 stop example_app || true

# 4. Navigate into the application folder
cd ~/ExampleApplication/

# 5. Install application dependencies
npm install

# 6. FIX: Create the SSL certificates if they don't exist
# This part is missing from the tutorial but required by your app
cd bin
if [ ! -f server.crt ]; then
    openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -nodes -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"
    cp server.key privatekey.pem
    cp server.crt certificate.pem
fi

# 7. Start the application from inside the bin folder
pm2 start www --name example_app --env=production

# 8. Save the PM2 list so it restarts on reboot
pm2 save