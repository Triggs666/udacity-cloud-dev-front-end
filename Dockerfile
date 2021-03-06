# Use NodeJS base image
FROM node:13

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./

# Define typescript config by copying ts*.json
COPY ts*.json ./

# Install dependencies
RUN npm install
RUN npm install -g ionic

# Copy app source
COPY . .

# build project
RUN ionic build

# Bind the port that the image will run on
EXPOSE 8100


# Define the Docker image's behavior at runtime
CMD ["ionic", "serve", "--external"]
