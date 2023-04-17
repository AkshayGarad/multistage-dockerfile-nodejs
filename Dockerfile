# Stage 1 - Build stage
FROM node:14-alpine AS build

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production

# Copy the application code to the container
COPY . .

# Build the application
RUN npm run build

# Stage 2 - Production stage
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy the production dependencies from the build stage
COPY --from=build /app/node_modules ./node_modules

# Copy the application code from the build stage
COPY --from=build /app/dist ./dist

# Expose the port on which the application will listen
EXPOSE 8080

# Set the command to run the application
CMD ["node", "dist/server.js"]