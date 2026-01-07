# -------- BUILD STAGE --------
FROM public.ecr.aws/amazoncorretto/amazoncorretto:21 AS builder

# Install required tools for mvnw
RUN yum install -y tar gzip

WORKDIR /app
COPY . .
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# -------- RUNTIME STAGE --------
FROM public.ecr.aws/amazoncorretto/amazoncorretto:21
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","app.jar"]

