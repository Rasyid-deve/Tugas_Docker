FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAVA_OPTS
ENV JAVA_OPTS=$JAVA_OPTS
RUN mkdir -p /app
WORKDIR /app

COPY Fibonacci.java /app

RUN ["javac", "Fibonacci.java"]

ENTRYPOINT ["java","Fibonacci"]
# For Spring-Boot project, use the entrypoint below to reduce Tomcat startup time.
#ENTRYPOINT exec java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar tugasdockerjava.jar
