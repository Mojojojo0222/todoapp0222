# -------- BUILD STAGE --------
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app
COPY . .

# 🔑 FIX PERMISSION
RUN chmod +x mvnw

RUN ./mvnw clean package -DskipTests

# -------- RUNTIME STAGE --------
FROM eclipse-temurin:21-jre

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8082
ENTRYPOINT ["java","-jar","app.jar"]

