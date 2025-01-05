FROM amazoncorretto:8-alpine-jdk as builder

WORKDIR /usr/src/app

COPY . .

RUN javac -d bin -sourcepath src src/*.java


FROM amazoncorretto:8-alpine-jre

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/bin bin/
COPY --from=builder /usr/src/app/data data/

RUN adduser -D appuser
USER appuser

CMD ["java", "-cp", "bin", "Main"]