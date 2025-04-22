# Use official OpenJDK base image
FROM openjdk:17

# Copy the built JAR into the container
COPY target/hello-world-1.0.jar /app/hello-world.jar

# Set the working directory
WORKDIR /app

# Run the application
CMD ["java", "-jar", "hello-world.jar"]
