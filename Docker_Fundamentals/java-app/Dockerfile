FROM eclipse-temurin:11-jdk-jammy

WORKDIR /app
COPY HelloWorld.java .

RUN javac HelloWorld.java

EXPOSE 8080
CMD ["java", "HelloWorld"]
