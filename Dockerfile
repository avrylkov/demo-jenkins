FROM redhat-openjdk18-openshift:1.3
VOLUME /tmp
ADD /target/demo-jenkins-0.0.1-SNAPSHOT.jar /deployments/demo-jenkins-app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /demo-jenkins-app.jar" ]