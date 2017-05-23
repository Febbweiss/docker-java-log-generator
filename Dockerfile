FROM frolvlad/alpine-oraclejdk8

RUN apk update \
    && apk add --no-cache curl \
	&& curl -sL -o log-generator-0.0.2.jar "https://github.com/Febbweiss/log-generator/releases/download/0.0.2/log-generator-0.0.2.jar" \
	&& mkdir -p /var/log/java \
	&& rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

WORKDIR /var/log/java
CMD ["java", "-jar", "/log-generator-0.0.2.jar", "-n", "15", "-r", "1000"]