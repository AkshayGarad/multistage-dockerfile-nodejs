# Multistage Dockerfile for Node.js Runtime Application
This repository contains an example Dockerfile for a Node.js runtime application that uses a multistage build process. The Dockerfile is designed to build a Docker image that can run a Node.js application in a production environment.

## Usage
To use this Dockerfile, you need to have Docker installed on your machine. Then, follow these steps:

1. Clone this repository to your local machine. 
```bash
https://github.com/AkshayGarad/multistage-dockerfile-nodejs.git
```
2. Change to the repository directory.
```bash
cd multistage-dockerfile-nodejs
```
3. Build the Docker image using the Dockerfile.
```bash
docker build -t yourimagename .
```
4. Run the Docker container using the newly built image.
```bash
docker run -p 8080:8080 yourimagename
```
5. Visit `http://localhost:8080` in your web browser to see the application running.

## Dockerfile Details
The Dockerfile uses a multistage build process to optimize the final image size. In the first stage, the Dockerfile uses the official Node.js 14-alpine image to install dependencies, copy the application code, and build the application. In the second stage, the Dockerfile uses the same Node.js 14-alpine image to create the production image. The production image only includes the dependencies needed to run the application and the built application code.

This approach helps to reduce the size of the final image by discarding unnecessary dependencies and build tools that are only needed during the build process.

In this Dockerfile, we have two stages. In the first stage (named "build"), we use the official Node.js 14-alpine image to install dependencies, copy the application code, and build the application. We also use the `npm ci` command instead of `npm install` for production use cases to ensure reproducibility of installed packages. Once the application is built, the image for the first stage is discarded.

In the second stage (named "production"), we again use the official Node.js 14-alpine image as our base image. We copy the production dependencies and the built application code from the previous stage using the `--from=build` flag. Finally, we expose the port on which the application will listen and set the command to run the application.

This approach helps to reduce the size of the final image by discarding unnecessary dependencies and build tools that are only needed during the build process.

## Contributing
If you find any issues or have suggestions for improving this Dockerfile, please open an issue or pull request in this repository. Contributions are always welcome!