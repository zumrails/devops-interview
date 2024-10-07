# Use the official Node.js image as a build stage
FROM node:16 AS build
WORKDIR /app

ARG API_URL
ENV API_URL=$API_URL

# Install gettext for envsubst
RUN apt-get update && apt-get install -y gettext
# Copy the package.json and package-lock.json files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the remaining files and build the Angular project
COPY . .

# Substitute environment variables in Angular environment configuration file
RUN echo $(envsubst < src/environments/environment.prod.ts) > src/environments/environment.prod.ts

# Build the Angular application
RUN npm run build --prod

#Indetifying ports to be exposed
EXPOSE 80

# Use the official Nginx image as a runtime stage
FROM nginx:latest AS runtime
COPY --from=build /app/dist/project.ui /usr/share/nginx/html