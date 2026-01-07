# -------- BUILD STAGE --------
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app
COPY . .
RUN ./mvnw clean package -DskipTests

# -------- RUNTIME STAGE --------
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/target/todoapp-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "app.jar"]

