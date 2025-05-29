# Use official Maven image to build the app
FROM maven:3.8.6-openjdk-17 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a smaller JRE image to run the app
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/helloworld-0.0.1-SNAPSHOT.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
