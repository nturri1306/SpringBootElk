#FROM openjdk:11 AS build

#COPY pom.xml mvnw ./
#RUN chmod +x mvnw
#COPY .mvn .mvn
#RUN /.mvnw dependency:resolve

#COPY src src
#RUN ./mvnw package -Dmaven.test.skip

# For Java 11,
FROM adoptopenjdk/openjdk11:alpine-jre

WORKDIR SpringBootElk

COPY /target/main-0.0.1-SNAPSHOT.jar  SpringBootElk.jar

#COPY --from=build target/*.jar SpringBootElk.jar

ENTRYPOINT ["java","-jar","SpringBootElk.jar"]

#docker build -t  nturri1306/logstash:latest .
#docker run   -p 8077:8077 nturri1306/springelk:latest