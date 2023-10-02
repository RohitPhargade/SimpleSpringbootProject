# Use an official OpenJDK base image
# Use an official OpenJDK base image for Java 17
#FROM openjdk:8-jdk-alpine
#FROM openjdk:11
#FROM eclipse-temurin:17-jdk-alpine
FROM my-local-openjdk:17


#VOLUME /tmp
#ARG JAR_FILE=target/spring-boot-docker.jar
#ADD ${JAR_FILE} app.jar


# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory into the container (maven)
#COPY target/your-app-name.jar app.jar
# Copy the JAR file from the build/libs directory into the container(gradle)
COPY build/libs/SimpleSpringbootProject-0.0.1-*.jar simple-app.jar


# Expose the port, application runs on 9090
EXPOSE 9090

# Command to run your application
CMD ["java", "-jar", "simple-app.jar"]
#CMD ["./wait-for-it.sh", "mysqldb", "3306", "--", "java", "-jar", "auto-app.jar"]