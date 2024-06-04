FROM amazoncorretto:17-al2-jdk AS mav_cms_builder
LABEL authors="mavincci"

WORKDIR /app

COPY ./ /app

RUN ./gradlew bootJar

FROM amazoncorretto:17-al2-jdk AS mav_cms_runtime
LABEL authors="mavincci"

EXPOSE 1080

WORKDIR /app

COPY --from=mav_cms_builder /app/build/libs/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

