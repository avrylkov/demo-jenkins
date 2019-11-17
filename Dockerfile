FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD /target/demo-jenkins-0.0.1-SNAPSHOT.jar /deployments/demo-jenkins-0.0.1-SNAPSHOT.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /demo-jenkins-0.0.1-SNAPSHOT.jar" ]