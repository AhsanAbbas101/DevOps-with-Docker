FROM amazoncorretto:8-al2023

WORKDIR /usr/src/app

COPY . .

RUN javac src/*.java

CMD ["java", "-cp", "src", "Main"]