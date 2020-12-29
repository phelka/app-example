FROM maven:3.6.3-openjdk-15 AS build
WORKDIR /usr/src/app

# store dependencies from pom.xml to image layer
COPY pom.xml .
RUN mvn dependency:go-offline -B

# build full app here with offline artifacts
COPY . .
RUN mvn clean package
RUN ls target

# run app in slimmed image
#openjdk:16-ea-23-jdk-alpine3.12
FROM openjdk:16-alpine
COPY --from=build /usr/src/app/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]

# slim images: https://aboullaite.me/speed-up-your-java-application-images-build-with-buildkit/
# https://whitfin.io/speeding-up-maven-docker-builds/
# or https://phauer.com/2019/no-fat-jar-in-docker-image/