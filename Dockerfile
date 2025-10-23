# 1. Start with an official Node.js image (lightweight Alpine version)
FROM node:lts-alpine

# 2. Set the "working directory" inside the container
WORKDIR /app

# 3. Copy package.json and package-lock.json (if it exists)
# Copy this *first* for better caching
COPY package*.json ./

# 4. Install the app's dependencies
RUN npm install

# 5. Copy the rest of the app's code (server.js) into the image
COPY . .

# 6. "Expose" the port the app runs on (documentation for Docker)
EXPOSE 8080

# 7. The command to run when the container starts
CMD [ "npm", "start" ]