FROM gradle:8.7-jdk17-jammy
WORKDIR /app
COPY . .


RUN chmod +x ./gradlew
RUN gradle bootJar

ENTRYPOINT ["java", "-jar", "/app/build/libs/backend-0.0.1-SNAPSHOT.jar"]
EXPOSE 8081