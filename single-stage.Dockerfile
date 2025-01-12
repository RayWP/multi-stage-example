FROM maven:3.9.5-eclipse-temurin-17
WORKDIR /app

# Copy all files and build the application
COPY pom.xml .
RUN mvn dependency:go-offline -B
COPY src ./src
RUN mvn clean package -DskipTests

# Expose and run the application
EXPOSE 8080
CMD ["java", "-jar", "target/app.jar"]