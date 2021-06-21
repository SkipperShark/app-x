# We use node 10 - OLD ( its ok for DEMO )
FROM node:12

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies and mssql-tools for sqlcmd
COPY package.json .
COPY package-lock.json .
RUN npm install --only=production

# Bundle app source
COPY . .
EXPOSE 3000

# Use entrypoint to trigger script
ENTRYPOINT /bin/bash ./entrypoint.sh