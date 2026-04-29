# Etapa 1: Build
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /app
COPY . .
RUN mvn -pl producto-service -am clean package -DskipTests
# Etapa 2: Runtime
FROM mcr.microsoft.com/openjdk/jdk:25-ubuntu
WORKDIR /app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
RUN chown -R appuser:appgroup /app
ARG SERVICE_NAME
COPY --from=builder /app/${SERVICE_NAME}/target/${SERVICE_NAME}-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080 8083 8084 8085 8761 8888 9009
USER appuser
ENTRYPOINT ["java", "-jar", "app.jar"]
