#docker run -d -p 8080:8080 -p 50000:50000 --name jenkins -v $(pwd)/jenkins_home:/var/jenkins_home jenkins/jenkins:2.157-alpine
FROM    jenkins/jenkins:2.164-alpine
USER    root
RUN     apk add --no-cache --update \
            build-base \
            docker \
            shadow \
        && usermod -a -G docker jenkins
USER    jenkins
HEALTHCHECK --interval=30s --timeout=30s --start-period=120s --retries=3 CMD [ "curl", "http://localhost:8080" ]