FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
COPY tugasdockerjava.jar tugasdockerjava.jar
EXPOSE 400
ENTRYPOINT exec java $JAVA_OPTS -jar tugasdockerjava.jar
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar tugasdockerjava.jar