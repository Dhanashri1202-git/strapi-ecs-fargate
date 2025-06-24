# Use Node 20 (LTS)
FROM node:20

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install all dependencies
RUN npm install

# Copy all app files
COPY . .

# Build the admin panel (Strapi Admin UI)
RUN npm run build

# Expose Strapi's default port
EXPOSE 1337

# Set environment variable for production (important for AWS)
ENV NODE_ENV=production

# Start the Strapi server
CMD ["npm", "run", "start"]

