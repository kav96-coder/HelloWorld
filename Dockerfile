# Use official Maven image to build the app
FROM maven:3.9.4-eclipse-temurin-21 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a smaller JDK image to run the app
FROM eclipse-temurin:21-jre
WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/hello-world-1.0.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
