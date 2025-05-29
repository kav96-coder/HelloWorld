# Use official Maven image to build the app
FROM eclipse-temurin:21 AS build

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use a smaller JDK image to run the app
FROM eclipse-temurin:21
WORKDIR /app

# Copy the jar from the build stage
COPY --from=build /app/target/helloworld-0.0.1-SNAPSHOT.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
