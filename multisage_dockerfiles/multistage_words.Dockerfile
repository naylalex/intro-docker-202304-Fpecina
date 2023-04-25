FROM maven:3.6.3-jdk-8 as compilado

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY . .

RUN mvn clean package -DskipTests
FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=compilado /app/target/words.jar .

CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "words.jar"]