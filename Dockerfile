FROM gcr.io/distroless/java:11
COPY target/*.jar app.jar
EXPOSE 8080
CMD ["app.jar"]

