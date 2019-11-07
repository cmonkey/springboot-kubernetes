FROM anapsix/alpine-java:8_jdk_unlimited

MAINTAINER Li xiandong <42.codemonkey at gmail.com>

VOLUME /opt

ARG JAR_FILE
ADD target/${JAR_FILE} /opt/restful-api.jar

EXPOSE 8010

RUN bash -c 'touch /opt/restful-api.jar'

ENV JAVA_OPTS="-Xmx1G -Xms1G -server -XX:+UseG1GC -XX:MaxGCPauseMillis=20 -XX:InitiatingHeapOccupancyPercent=35 -XX:+ExplicitGCInvokesConcurrent -Djava.awt.headless=true -Xloggc:/opt/application-gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/jvmdump"

ENV APP_ENV="-Dspring.profiles.active=dev"

ENTRYPOINT exec java $JAVA_OPTS $APP_ENV -jar -Djava.security.egd=file:/dev/./urandom /opt/restful-api.jar
