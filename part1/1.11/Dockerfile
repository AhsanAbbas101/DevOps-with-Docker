# Dockerfile for exercise 1.11

# Java baseline
FROM amazoncorretto:8-al2023

EXPOSE 8080

WORKDIR /usr/src/app

# Copy the files required for dependencies to be installed
COPY . .

# build
RUN ./mvnw package

# run
CMD [ "java","-jar", "./target/docker-example-1.1.3.jar" ]

