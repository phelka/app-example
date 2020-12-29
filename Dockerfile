FROM maven:3.6.3-openjdk-15 AS build
WORKDIR /usr/src/app

# store dependencies from pom.xml to image layer
COPY webapp/pom.xml ./webapp/pom.xml
COPY domain/pom.xml ./domain/pom.xml
COPY pom.xml .
RUN mvn dependency:go-offline -B

# build full app here with offline artifacts
COPY . .
RUN mvn clean package

# run app in slimmed image
FROM openjdk:16-alpine
COPY --from=build /usr/src/app/webapp/target/*.jar app.jar

# unpack fat jar to speed-up startup
RUN jar -xf app.jar
ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]

# slim images: https://codefresh.io/docker-tutorial/java_docker_pipeline/
# https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#boot-features-container-images
# https://aboullaite.me/speed-up-your-java-application-images-build-with-buildkit/
# https://whitfin.io/speeding-up-maven-docker-builds/
# or https://phauer.com/2019/no-fat-jar-in-docker-image/