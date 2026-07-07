FROM openjdk:17.0.1

RUN mkdir /opt/docker-exercises

COPY ./build/libs/docker-exercises-project-1.0-SNAPSHOT.jar /opt/docker-exercises

WORKDIR /opt/docker-exercises

EXPOSE 8080

CMD ["java", "-jar", "docker-exercises-project-1.0-SNAPSHOT.jar"]